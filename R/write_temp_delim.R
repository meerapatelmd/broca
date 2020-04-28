#' A simply write txt to a temp file with a logging feature
#' @return path to temp txt file
#' @param x data to write
#' @importFrom readr write_delim
#' @export

write_temp_delim <-
        function(x, delimiter, log_details = NULL, ...) {


                temp_file <- tempfile(fileext = ".txt")

                if (!is.null(log_details)) {
                        log_this(path_to_file = temp_file,
                                 activity = "output",
                                 comment = "",
                                 details = log_details)
                }

                readr::write_delim(x = x,
                                 path = temp_file,
                                 delim = delimiter,
                                 ...)

                return(temp_file)
        }