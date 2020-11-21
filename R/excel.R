#' Is the file an excel file?
#' @export

is_excel <-
        function(file) {
                grepl("[.]xlsx$", file, ignore.case = TRUE)
        }









#' Reads entire XLSX file into a list of dataframes
#' @param full_xlsx_fn full path to xlsx file
#' @import readxl
#' @import purrr
#' @export


read_full_excel <-
        function(full_xlsx_fn, log = FALSE, log_details = "") {

            if (log == TRUE) {
                            log_this(path_to_file = full_xlsx_fn,
                                     activity_type = "read",
                                     details = log_details,
                                     function_used = "read_full_excel")
            }
                        return(
                                full_xlsx_fn %>%
                                        readxl::excel_sheets() %>%
                                        set_names() %>%
                                        purrr::map(readxl::read_excel, path = full_xlsx_fn, col_types = "text")
                        )
        }






#' Write an Excel with a Log Entry
#' @param x data to write, either as a list or a single dataframe
#' @param file path to xlsx file
#' @param log_details log detail or comment to include in the log entry. NULL if no log entry is required.
#' @param ... optional parameters passed to openxlsx::write.xlsx
#' @importFrom openxlsx write.xlsx
#' @export

write_full_excel <-
        function(x,
                 file,
                 log = FALSE,
                 log_details = "",
                 ...) {

                if (log == TRUE) {
                        log_this(path_to_file = file,
                                 activity_type = "write",
                                 function_used = "write_full_excel",
                                 details = log_details
                        )
                }

                openxlsx::write.xlsx(x = x,
                                     file = file,
                                     ...)
        }





#' A simply write csv to a temp file with a logging feature
#' @description A call to simply_write_csv, returning the path to the temp file
#' @param x data to write
#' @export

write_temp_xlsx <-
        function(x,
                 log = FALSE,
                 log_details = "") {


                temp_file <- tempfile(fileext = ".xlsx")

                if (log == TRUE) {
                        log_this(path_to_file = temp_file,
                                 activity_type = "write",
                                 function_used = "write_temp_xlsx",
                                 details = log_details)
                }

                write_full_excel(x = x,
                                 file = temp_file)

                return(temp_file)
        }





