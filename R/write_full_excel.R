#' Write an Excel with a Log Entry
#' @param x data to write, either as a list or a single dataframe
#' @param file path to xlsx file
#' @param log_details log detail or comment to include in the log entry. NULL if no log entry is required.
#' @importFrom openxlsx write.xlsx
#' @export

write_full_excel <-
        function(x,
                 file,
                 log_details = NULL) {

                if (!is.null(log_details)) {
                        log_this(path_to_file = file,
                                 activity = "output",
                                 comment = "",
                                 details = log_details)
                }

                openxlsx::write.xlsx(x = x,
                                     file = file)
        }