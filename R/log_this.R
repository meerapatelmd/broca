#' Universal log function to use to log items
#' @import dplyr
#' @import readr
#' @export

log_this <-
        function(path_to_file,
                 activity,
                 comment = "",
                 details = "") {

                if (!file.exists("log.md")) {
                    readr::write_lines(paste(mirCat::stamp_this(),
                                       path_to_file,
                                       activity,
                                       comment,
                                       details, collapse = "\t"),
                                       sep = "\n",
                                       path = "log.md")
                } else {
                    readr::write_lines(paste(mirCat::stamp_this(),
                                             path_to_file,
                                             activity,
                                             comment,
                                             details, collapse = "\t"),
                                       sep = "\n",
                                       path = "log.md",
                                       append = TRUE)
                }
        }
