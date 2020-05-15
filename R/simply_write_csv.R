#' A simple write to csv with a logging feature
#' @param x data to write
#' @param path path to output file
#' @importFrom readr write_csv
#' @export

simply_write_csv <-
        function(x, file, ..., log = TRUE, log_details = "") {

                if (log == TRUE) {
                        log_this(path_to_file = file,
                                 activity_type = "write",
                                 function_used = "simply_write_csv",
                                 details = log_details)
                }

                readr::write_csv(x = x,
                                 path = file,
                                 ...)
        }