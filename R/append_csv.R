#' Append a dataframe to a csv by binding rows to prevent column mismatch
#' @param fn filename to be appended
#' @importFrom readr write_csv
#' @importFrom dplyr bind_rows
#' @importFrom dplyr mutate_all
#' @importFrom readr read_csv
#' @export
#'
append_csv <-
        function(csv_fn, dataframe, log = TRUE, log_details = "") {
                        csv_dataframe <- readr::read_csv(csv_fn, col_types = cols(.default = "c")) %>%
                                                dplyr::mutate_all(as.character)

                        new_csv_dataframe <- dplyr::bind_rows(csv_dataframe,
                                                       dataframe %>%
                                                               dplyr::mutate_all(as.character))

                        readr::write_csv(new_csv_dataframe, csv_fn)

                        if (log == TRUE) {
                            log_this(path_to_file = csv_fn,
                                     activity = "output",
                                     comment = "appended csv file with dataframe",
                                     details = log_details)
                        }
        }
