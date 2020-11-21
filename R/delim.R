#' A simply write txt to a temp file with a logging feature
#' @return path to temp txt file
#' @param x data to write
#' @param delimiter delimiter for the readr::write_delim argument
#' @param ... additional arguments for the readr::write_delim argument.
#' @importFrom readr write_delim
#' @export

write_temp_delim <-
        function(x, delimiter, log = TRUE, log_details = "", ...) {


                temp_file <- tempfile(fileext = ".txt")

                if (log == TRUE) {
                        log_this(path_to_file = temp_file,
                                 activity_type = "write",
                                 function_used = "write_temp_delim",
                                 details = log_details)
                }

                readr::write_delim(x = x,
                                 path = temp_file,
                                 delim = delimiter,
                                 ...)

                return(temp_file)
        }






