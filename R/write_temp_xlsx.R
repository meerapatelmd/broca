#' A simply write csv to a temp file with a logging feature
#' @description A call to simply_write_csv, returning the path to the temp file
#' @param x data to write
#' @export

write_temp_xlsx <-
        function(x, log = TRUE, log_details = "") {


                temp_file <- tempfile(fileext = ".xlsx")

                if (log == TRUE) {
                        log_this(path_to_file = temp_file,
                                 activity_type = "write",
                                 function_used = "write_temp_xlsx",
                                 details = log_details)
                }

                write_full_excel(x = x,
                                 file = temp_file)

                return(temp_file)
        }
