#' Reads a csv
#' @importFrom readr read_csv
#' @export

simply_read_csv <-
        function(path_to_csv, log = TRUE, log_details = "") {
            if (log == TRUE) {
                            log_this(path_to_file = path_to_csv,
                                     activity_type = "read",
                                     details = log_details,
                                     function_used = "simply_read_csv")
            }
            readr::read_csv(path_to_csv, col_types = readr::cols(.default = "c"))
        }
