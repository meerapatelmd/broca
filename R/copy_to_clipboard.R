#' Copies dataframe copied to clipboard
#' @export

copy_to_clipboard <- function(dataframe, log = TRUE, log_details = "") {
                            clip <- pipe("pbcopy", "wb")
                            write.table(dataframe, clip, sep = "\t", row.names = FALSE)
                            close(clip)

                            if (log == TRUE) {
                                log_this(path_to_file = "",
                                         activity = "output",
                                         comment = "clipboard",
                                         details = log_details)
                            }
}
