#' A simple write to csv with a logging feature
#' @param x data to write
#' @param path path to output file
#' @importFrom readr write_csv
#' @export

simply_write_csv <-
        function(x, path, ..., log_details = NULL) {

                if (!is.null(log_details)) {
                        log_this(path_to_file = path,
                                 activity = "output",
                                 comment = "",
                                 details = log_details)
                }

                readr::write_csv(x = x,
                                 path = path,
                                 ...)
        }