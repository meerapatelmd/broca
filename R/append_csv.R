#' @title
#' Append a data frame to a csv file
#' @description
#' This function reads the data in a csv file into the R environment and binds the input data frame, and overwrites the file with the combined data to maintain column ordering of the input and not loosing any extra columns present in the input data frame.
#'
#' @param csv_fn        csv file
#' @param .data         data frame to append
#' @param log           PARAM_DESCRIPTION, Default: TRUE
#' @param log_details   PARAM_DESCRIPTION, Default: ''

#' @seealso
#'  \code{\link[readr]{read_delim}},\code{\link[readr]{write_delim}}
#'  \code{\link[dplyr]{mutate_all}},\code{\link[dplyr]{bind}}
#' @rdname append_csv
#' @export
#' @importFrom readr read_csv write_csv
#' @importFrom dplyr mutate_all bind_rows %>%


append_csv <-
        function(csv_fn,
                 .data,
                 log = TRUE,
                 log_details = "") {
                        csv_dataframe <- readr::read_csv(csv_fn, col_types = cols(.default = "c")) %>%
                                                dplyr::mutate_all(as.character)

                        new_csv_dataframe <- dplyr::bind_rows(csv_dataframe,
                                                       .data %>%
                                                               dplyr::mutate_all(as.character))

                        readr::write_csv(new_csv_dataframe, csv_fn)

                        if (log == TRUE) {
                            log_this(path_to_file = csv_fn,
                                     activity = "output",
                                     details = log_details)
                        }
        }
