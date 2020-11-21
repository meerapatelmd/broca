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





#' @title
#' Read a dataframe the clipboard
#' @param header        TRUE if dataframe has a header. Default: TRUE
#' @param log           Log this function call to a log.md file? Default: TRUE
#' @param log_details   If log is TRUE, additional notes to include with the log entry. Default: ''
#' @rdname read_clipboard
#' @family clipboard
#' @export
#' @importFrom utils read.table

read_clipboard <-
    function(header = TRUE, log = TRUE, log_details = "") {
                        if (log == TRUE) {
                            log_this(path_to_file = "",
                                     activity_type = "read",
                                     details = log_details,
                                     function_used = "read_clipboard")
                        }

                            if (header == TRUE) {
                                    utils::read.table(pipe("pbpaste"), sep= "\t", header= TRUE)
                            } else {
                                    utils::read.table(pipe("pbpaste"), sep= "\t", header= FALSE)
                            }
}




