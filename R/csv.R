#' Is the file an csv file?
#' @export

is_csv <-
        function(filename) {
                grepl("[.]csv$", filename, ignore.case = TRUE)
        }









#' Reads a csv
#' @importFrom readr read_csv
#' @export

simply_read_csv <-
        function(path_to_csv, log = FALSE, log_details = "") {
            if (log == TRUE) {
                            log_this(path_to_file = path_to_csv,
                                     activity_type = "read",
                                     details = log_details,
                                     function_used = "simply_read_csv")
            }
            readr::read_csv(path_to_csv, col_types = readr::cols(.default = "c"))
        }





#' A simple write to csv with a logging feature
#' @param x data to write
#' @param path path to output file
#' @importFrom readr write_csv
#' @export

simply_write_csv <-
        function(x, file, ..., log = FALSE, log_details = "") {

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





#' A simply write csv to a temp file with a logging feature
#' @description A call to simply_write_csv, returning the path to the temp file
#' @param x data to write
#' @param ... arguments for readr::write_csv
#' @export

write_temp_csv <-
        function(x, log = FALSE, log_details = "", ...) {


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






