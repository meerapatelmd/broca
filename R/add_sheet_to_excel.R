#' Add a dataframe to an existing Excel file
#' @param file path to Excel file
#' @param new_sheet_name name of new sheet
#' @param dataframe dataframe tp write to Excel file
#' @param commit If TRUE, performs a git commit before and after the new sheet is added
#' @importFrom glitter modified_files
#' @importFrom glitter untracked_files
#' @importFrom glitter add_commit_some
#' @export

add_sheet_to_excel <-
        function(file,
                 new_sheet_name,
                 dataframe,
                 commit = TRUE)    {



                if (commit == TRUE) {
                        path_to_file <- dirname(file)
                        if (path_to_file == ".") {
                                path_to_file <- getwd()
                        }

                        if (file %in% c(glitter::modified_files(path_to_local_repo = path_to_file),
                                        glitter::untracked_files(path_to_local_repo = path_to_file))) {
                                glitter::add_commit_some(path_to_local_repo = path_to_file,
                                                         filenames = file,
                                                         commit_message = paste0("update ", file, " before adding new sheet ", new_sheet_name))

                        }


                        wb <- read_full_excel(full_xlsx_fn = file)

                        wb[[length(wb)+1]] <- dataframe
                        names(wb)[length(wb)] <- new_sheet_name


                        write_full_excel(x = wb,
                                         file = file)


                        add_commit_some(path_to_local_repo = path_to_file,
                                        filenames = file,
                                        commit_message = paste0("update ", file, " after adding new sheet ", new_sheet_name))
                } else {

                        wb <- read_full_excel(full_xlsx_fn = file)

                        wb[[length(wb)+1]] <- dataframe
                        names(wb)[length(wb)] <- new_sheet_name


                        write_full_excel(x = wb,
                                         file = file)

                }
        }