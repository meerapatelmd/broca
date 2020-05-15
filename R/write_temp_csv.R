#' A simply write csv to a temp file with a logging feature
#' @description A call to simply_write_csv, returning the path to the temp file
#' @param x data to write
#' @param ... arguments for readr::write_csv
#' @export

write_temp_csv <-
        function(x, log = TRUE, log_details = "", ...) {


                temp_file <- tempfile(fileext = ".csv")

                if (log == TRUE) {
                        log_this(path_to_file = temp_file,
                                 activity_type = "write",
                                 function_used = "write_temp_csv",
                                 details = log_details)
                }

                simply_write_csv(x = x,
                                 file = temp_file,
                                 log = FALSE,
                                 ...)

                return(temp_file)
        }

