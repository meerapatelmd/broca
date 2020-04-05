#' Reads entire XLSX file into a list of dataframes
#' @param full_xlsx_fn full path to xlsx filename
#' @import readxl
#' @import purrr
#' @export


read_full_excel <-
        function(full_xlsx_fn, log = TRUE, log_details = "") {

            if (log == TRUE) {
                log_this(path_to_file = full_xlsx_fn,
                         activity = "input",
                         comment = "",
                         details = log_details)
            }
                        return(
                                full_xlsx_fn %>%
                                        readxl::excel_sheets() %>%
                                        set_names() %>%
                                        purrr::map(readxl::read_excel, path = full_xlsx_fn, col_types = "text")
                        )
        }

