#' Universal log function to use to log items
#' @importFrom stampede stamp_this
#' @importFrom readr write_lines
#' @export

log_this <-
        function(path_to_file,
                 activity_type,
                 function_used = "",
                 details = "") {

                if (!file.exists("log.md")) {
                    readr::write_lines(paste(stampede::stamp_this(),
                                             activity_type,
                                             function_used,
                                             path_to_file,
                                             details,
                                             collapse = "\t"),
                                       sep = "\n",
                                       path = "log.md")
                } else {
                    readr::write_lines(paste(stampede::stamp_this(),
                                             activity_type,
                                             function_used,
                                             path_to_file,
                                             details,
                                             collapse = "\t"),
                                       sep = "\n",
                                       path = "log.md",
                                       append = TRUE)
                }
        }
