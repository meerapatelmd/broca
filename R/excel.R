#' @title
#' Does the file have an xlsx extension?
#'
#' @description
#' Check if the file has a name that matches the ".xlsx" file extension pattern.
#'
#' @inheritParams args
#' @rdname is_excel
#' @family logical functions
#' @family excel functions
#' @export

is_excel <-
        function(file) {
                grepl("[.]xlsx$", file, ignore.case = TRUE)
        }


#' @title
#' Read an Entire Excel Workbook
#'
#' @description
#' Read an Entire Excel Workbook into a list of dataframes named by the original spreadsheet name. Arguments are passed to \code{\link[readxl]{read_excel}} for each sheet.
#'
#' @inheritParams args
#' @inheritParams readxl::read_excel
#' @family read functions
#' @family excel functions
#' @seealso
#'  \code{\link[readxl]{excel_sheets}},\code{\link[readxl]{read_excel}}
#'  \code{\link[purrr]{set_names}},\code{\link[purrr]{map}}
#' @rdname read_full_excel
#' @export
#' @importFrom readxl excel_sheets read_excel
#' @importFrom purrr set_names map

read_full_excel <-
        function(file,
                 col_names = TRUE,
                 col_types = "text",
                 na = "",
                 trim_ws = TRUE,
                 skip = 0,
                 n_max = Inf,
                 guess_max = min(1000, n_max),
                 progress = readxl_progress(),
                 .name_repair = "unique",
                 log = "DEPRECATED",
                 log_details = "") {

            if (log == TRUE) {
                            log_this(path_to_file = file,
                                     activity_type = "read",
                                     details = log_details,
                                     function_used = "read_full_excel")
            }

                                file %>%
                                        readxl::excel_sheets() %>%
                                        purrr::set_names() %>%
                                        purrr::map(readxl::read_excel,
                                                   path = file,
                                                   col_names = col_names,
                                                   col_types = col_types,
                                                   na = na,
                                                   trim_ws = trim_ws,
                                                   skip = skip,
                                                   n_max = n_max,
                                                   guess_max = guess_max,
                                                   progress = progress,
                                                   .name_repair = .name_repair)

        }






#' @title
#' Write a List of Dataframes as an Excel
#'
#' @description
#' Write an Excel file using \code{\link[openxlsx]{write.xlsx}}.
#'
#' @inheritParams args
#' @inheritParams openxlsx::write.xlsx
#' @seealso
#'  \code{\link[openxlsx]{write.xlsx}}
#' @rdname write_full_excel
#' @export
#' @importFrom openxlsx write.xlsx
#' @family write functions
#' @family excel functions



write_full_excel <-
        function(x,
                 file,
                 asTable = FALSE,
                 ...,
                 log = "DEPRECATED",
                 log_details = "") {

                if (log == TRUE) {
                        log_this(path_to_file = file,
                                 activity_type = "write",
                                 function_used = "write_full_excel",
                                 details = log_details
                        )
                }

                openxlsx::write.xlsx(x = x,
                                     file = file,
                                     asTable = asTable,
                                     ...)
        }





#' @title
#' Write a List of Dataframes as a Temporary Excel
#'
#' @description
#' Write a temporary Excel file using \code{\link[openxlsx]{write.xlsx}}. The Path to the file is returned.
#'
#' @inheritParams args
#' @inheritParams openxlsx::write.xlsx
#' @rdname write_temp_xlsx
#' @export
#' @family write functions
#' @family excel functions

write_temp_xlsx <-
        function(x,
                 asTable = FALSE,
                 ...,
                 log = "DEPRECATED",
                 log_details = "") {


                temp_file <- tempfile(fileext = ".xlsx")

                if (log == TRUE) {
                        log_this(path_to_file = temp_file,
                                 activity_type = "write",
                                 function_used = "write_temp_xlsx",
                                 details = log_details)
                }

                write_full_excel(x = x,
                                 file = temp_file,
                                 asTable = asTable,
                                 ...)

                return(temp_file)
        }





