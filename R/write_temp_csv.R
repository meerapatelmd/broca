#' A simply write csv to a temp file with a logging feature
#' @description A call to simply_write_csv, returning the path to the temp file
#' @param x data to write
#' @export

write_temp_csv <-
        function(x, log_details = NULL, ...) {


                temp_file <- tempfile(fileext = ".csv")

                if (!is.null(log_details)) {
                        log_this(path_to_file = temp_file,
                                 activity = "output",
                                 comment = "",
                                 details = log_details)
                }

                simply_write_csv(x = x,
                                 path = temp_file,
                                 ...)

                return(temp_file)
        }