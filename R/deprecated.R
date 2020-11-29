#' @title
#' Create log.md if it doesn't exist
#' @rdname create_log.md
#' @export
#' @importFrom tibble tribble
#' @importFrom readr write_tsv
#' @description (Deprecated)

create_log.md <-
        function() {
                if (!file.exists("log.md")) {

                        .Deprecated()
                        new_log <-
                        tibble::tribble(~Timestamp,
                                        ~`Activity Type`,
                                        ~Function,
                                        ~File,
                                        ~Details)

                        readr::write_tsv(new_log,
                                         file = "log.md")
                }

        }






#' @title
#' Universal log function to use to log items
#' @rdname log_this
#' @export
#' @importFrom readr write_tsv
#' @importFrom tibble tibble
#' @description (Deprecated)

log_this <-
        function(path_to_file,
                 activity_type,
                 function_used = "",
                 details = "") {

                .Deprecated()
                create_log.md()

                readr::write_tsv(tibble::tibble(Timestamp = Sys.time(),
                                             `Activity Type` = activity_type,
                                             Function = function_used,
                                             File = path_to_file,
                                             Details = details),
                                       file = "log.md",
                                       append = TRUE)
        }





