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
                 log = TRUE,
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