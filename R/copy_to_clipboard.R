#' @title
#' Copy a data frame to the clipboard
#' @param dataframe     dataframe
#' @param log           Log this function call to a log.md file? Default: TRUE
#' @param log_details   If log is TRUE, additional notes to include with the log entry. PARAM_DESCRIPTION, Default: ''
#' @rdname copy_to_clipboard
#' @family clipboard
#' @export
#' @importFrom utils write.table

copy_to_clipboard <-
        function(dataframe, log = TRUE, log_details = "") {
                            clip <- pipe("pbcopy", "wb")
                            utils::write.table(dataframe, clip, sep = "\t", row.names = FALSE)
                            close(clip)

                            if (log == TRUE) {
                                log_this(path_to_file = "",
                                         activity_type = "write",
                                         details = log_details,
                                         function_used = "copy_to_clipboard")
                            }
}
