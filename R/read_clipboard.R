#' Reads from clipboard
#' @export
#'
read_clipboard <- function(header = TRUE, log = TRUE, log_details = "") {
    if (log == TRUE) {
        log_this(path_to_file = csv_fn,
                 activity = "input",
                 comment = "clipboard",
                 details = log_details)
    }
        if (header == TRUE) {
                return(read.table(pipe("pbpaste"), sep= "\t", header= TRUE))
        } else {
                return(read.table(pipe("pbpaste"), sep= "\t", header= FALSE))
        }
}
