#' @title
#' Universal log function to use to log items
#' @seealso
#'  \code{\link[rubix]{blank_tibble}}
#'  \code{\link[readr]{write_delim}}
#'  \code{\link[tibble]{tibble}}
#'  \code{\link[stampede]{stamp_this}}
#' @rdname log_this
#' @export
#' @importFrom rubix blank_tibble
#' @importFrom readr write_tsv
#' @importFrom tibble tibble
#' @importFrom stampede stamp_this

log_this <-
        function(path_to_file,
                 activity_type,
                 function_used = "",
                 details = "") {

                create_log.md()

                readr::write_tsv(tibble::tibble(Timestamp = stampede::stamp_this(),
                                             `Activity Type` = activity_type,
                                             Function = function_used,
                                             File = path_to_file,
                                             Details = details),
                                       path = "log.md",
                                       append = TRUE)
        }
