#' @title
#' Create R Objects from Formal Argument Default Values
#'
#' @description
#' Declare formal arguments of a function along with their default values as R objects.
#'
#' @param fun PARAM_DESCRIPTION
#' @param verbose If true, prints the R object names with value assignments in the console, Default: TRUE
#'
#' @seealso
#'  \code{\link[secretary]{c("typewrite", "typewrite")}},\code{\link[secretary]{character(0)}}
#'  \code{\link[purrr]{map}}
#' @rdname declare_default_args
#' @export
#' @importFrom secretary typewrite enbold
#' @importFrom purrr map


declare_default_args <-
        function(fun,
                 verbose = TRUE) {

                nms <- names(formals(fun))
                values <- unname(formals(fun))


                if (verbose) {

                        secretary::typewrite(secretary::enbold("Objects:"))

                        mapply(paste0, nms, " <- ", values) %>%
                                purrr::map(~ secretary::typewrite(.,
                                                                  tabs = 3,
                                                                  timepunched = FALSE))

                }

                for (i in seq_along(nms)) {
                        assign(
                                x = nms[i],
                                value = values[[i]],
                                envir = parent.frame()
                        )
                }
        }
