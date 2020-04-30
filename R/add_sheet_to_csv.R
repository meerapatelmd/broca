#' Combine a new dataframe as a new sheet to an existing csv into a Excel file
#' @param file path to csv file
#' @param new_sheet_name name of new sheet
#' @param dataframe dataframe tp write to Excel file
#' @param commit If TRUE, performs a git commit before and after the new sheet is added
#' @return Returns the name of the new xlsx filename
#' @importFrom glitter modified_files
#' @importFrom glitter untracked_files
#' @importFrom glitter add_commit_some
#' @importFrom cave strip_fn
#' @export

add_sheet_to_csv <-
        function(file,
                 new_sheet_name,
                 dataframe,
                 commit = TRUE)    {

                new_xlsx_fn <- paste0(cave::strip_fn(file, rm_path = FALSE), ".xlsx")

                if (commit == TRUE) {
                        path_to_file <- dirname(file)
                        if (path_to_file == ".") {
                                path_to_file <- getwd()
                        }

                        if (file %in% c(glitter::modified_files(path_to_local_repo = path_to_file),
                                        glitter::untracked_files(path_to_local_repo = path_to_file))) {
                                glitter::add_commit_some(path_to_local_repo = path_to_file,
                                                         filenames = file,
                                                         commit_message = paste0("update ", file, " before combining it with new sheet ", new_sheet_name))

                        }

                        data <- list()

                        data[[1]] <- simply_read_csv(path_to_csv = file)
                        data[[1+length(data)]] <- dataframe
                        names(data)[length(data)] <- new_sheet_name

                        write_full_excel(x = data,
                                                file = new_xlsx_fn)

                        file.remove(file)

                        glitter::add_commit_some(path_to_local_repo = path_to_file,
                                                 filenames = c(file, new_xlsx_fn),
                                                 commit_message = paste0("update ", file, " after adding new sheet ", new_sheet_name))
                } else {
                        path_to_file <- dirname(file)
                        if (path_to_file == ".") {
                                path_to_file <- getwd()
                        }


                        data <- list()

                        data[[1]] <- simply_read_csv(path_to_csv = file)
                        data[[1+length(data)]] <- dataframe
                        names(data)[length(data)] <- new_sheet_name

                        write_full_excel(x = data,
                                         file = new_xlsx_fn)

                        file.remove(file)

                }

                return(new_xlsx_fn)
        }