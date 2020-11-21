#' Is the file an csv file?
#' @export
is_csv <-
        function(file) {
                grepl("[.]csv$", file, ignore.case = TRUE)
        }

#' Reads a csv
#' @importFrom readr read_csv
#' @export

simply_read_csv <-
        function(file,
                 col_names = TRUE,
                 col_types = readr::cols(.default = "c"),
                 locale = default_locale(),
                 na = c("", "NA"),
                 quoted_na = TRUE,
                 quote = "\"",
                 comment = "",
                 trim_ws = TRUE,
                 skip = 0,
                 n_max = Inf,
                 guess_max = min(1000, n_max),
                 progress = show_progress(),
                 skip_empty_rows = TRUE,
                 log = FALSE,
                 log_details = "") {


            if (log == TRUE) {
                            log_this(path_to_file = path_to_csv,
                                     activity_type = "read",
                                     details = log_details,
                                     function_used = "simply_read_csv")
            }

            readr::read_csv(file = file,
                            col_names = col_names,
                            col_types = col_types,
                            locale = locale,
                            na = na,
                            quoted_na = quoted_na,
                            quote = quote,
                            comment = comment,
                            trim_ws = trim_ws,
                            skip = skip,
                            n_max = n_max,
                            guess_max = guess_max,
                            progress = progress,
                            skip_empty_rows = skip_empty_rows)
        }





#' A simple write to csv with a logging feature
#' @param x data to write
#' @param path path to output file
#' @importFrom readr write_csv
#' @export

simply_write_csv <-
        function(x,
                 file,
                 na = "NA",
                 append = FALSE,
                 col_names = !append,
                 quote_escape = "double",
                 eol = "\n",
                 log = FALSE,
                 log_details = "") {


                if (log == TRUE) {
                        log_this(path_to_file = file,
                                 activity_type = "write",
                                 function_used = "simply_write_csv",
                                 details = log_details)
                }

                readr::write_csv(x = x,
                                 file = file,
                                 na = na,
                                 append = append,
                                 col_names = col_names,
                                 quote_escape = quote_escape,
                                 eol = eol)
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






