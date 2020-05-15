#' Create Log.md if it doesn't exist
#' @importFrom rubix blank_tibble
#' @importFrom readr write_tsv
#' @export

create_log.md <-
        function() {
                if (!file.exists("log.md")) {

                        new_log <- rubix::blank_tibble(column_names =  c(
                                                                        "Timestamp",
                                                                        "Activity Type",
                                                                        "Function",
                                                                        "File",
                                                                        "Details"
                                                                        )
                                                       )
                        readr::write_tsv(new_log,
                                         path = "log.md")
                }

        }

