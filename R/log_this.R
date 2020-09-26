#' @title
#' Universal log function to use to log items
#' @seealso
#'  \code{\link[rubix]{blank_tibble}}
#'  \code{\link[readr]{write_delim}}
#'  \code{\link[tibble]{tibble}}
#'  \code{\link[stampede]{stamp_this}}
#' @rdname log_this
#' @export
#' @importFrom readr write_tsv
#' @importFrom tibble tibble

log_this <-
        function(path_to_file,
                 activity_type,
                 function_used = "",
                 details = "") {

                create_log.md()

                readr::write_tsv(tibble::tibble(Timestamp = Sys.time(),
                                             `Activity Type` = activity_type,
                                             Function = function_used,
                                             File = path_to_file,
                                             Details = details),
                                       path = "log.md",
                                       append = TRUE)
        }
