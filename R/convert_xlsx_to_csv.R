#' Convert a single sheet Excel file to a csv
#' @description This function only operates on Excel files with only 1 tab
#' @param xlsx_file path to Excel file
#' @param remove TRUE if the source Excel file should be deleted. Defaults to FALSE.
#' @importFrom cave strip_fn
#' @importFrom secretary typewrite_error
#' @export

convert_xlsx_to_csv <-
        function(xlsx_file, remove = FALSE) {
                csv_fn <- paste0(cave::strip_fn(xlsx_file, rm_path = FALSE), ".csv")
                input_data <- read_full_excel(full_xlsx_fn = xlsx_file,
                                                     log_details = paste0("converting ", xlsx_file, " to ", csv_fn))

                if (length(input_data) > 0) {
                        secretary::typewrite_error(xlsx_file,
                                                   "has more than 1 tabs.")
                } else {
                        output_data <- input_data[[1]]
                        simply_write_csv(x = output_data,
                                                path = csv_fn,
                                                log_details = paste0("converted from ", xlsx_file))

                        if (remove == TRUE) {
                                file.remove(xlsx_fn)
                        }
                        return(csv_fn)
                }
        }