#' @title
#' Create log.md if it doesn't exist
#' @seealso
#'  \code{\link[tibble]{tribble}}
#'  \code{\link[readr]{write_delim}}
#' @rdname create_log.md
#' @export
#' @importFrom tibble tribble
#' @importFrom readr write_tsv

create_log.md <-
        function() {
                if (!file.exists("log.md")) {

                        new_log <-
                        tibble::tribble(~Timestamp,
                                        ~`Activity Type`,
                                        ~Function,
                                        ~File,
                                        ~Details)

                        readr::write_tsv(new_log,
                                         path = "log.md")
                }

        }

