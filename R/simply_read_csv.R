#' Reads a csv
#' @importFrom readr read_csv
#' @export

simply_read_csv <-
        function(path_to_csv, log = TRUE, log_details = "") {
            if (log == TRUE) {
                log_this(path_to_file = csv_fn,
                         activity = "input",
                         comment = "",
                         details = log_details)
            }
            readr::read_csv(path_to_csv, col_types = readr::cols(.default = "c"))
        }
