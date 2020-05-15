#' Universal log function to use to log items
#' @importFrom stampede stamp_this
#' @importFrom readr write_tsv
#' @export

log_this <-
        function(path_to_file,
                 activity_type,
                 function_used = "",
                 details = "") {

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
                    readr::write_tsv(tibble::tibble(Timestamp = stampede::stamp_this(),
                                             `Activity Type` = activity_type,
                                             Function = function_used,
                                             File = path_to_file,
                                             Details = details),
                                       path = "log.md",
                                       append = TRUE)
        }
