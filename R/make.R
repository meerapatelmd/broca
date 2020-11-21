#' @title
#' Make a tribble skeleton
#' @param .data data frame
#' @seealso
#'  \code{\link[dplyr]{mutate_all}}
#' @rdname makeTribble
#' @export
#' @importFrom dplyr mutate_all

makeTribble <-
        function(.data) {

                .data <-
                        .data %>%
                        dplyr::mutate_all(~paste0("'", ., "'"))

                output <- vector()
                for (i in 1:nrow(.data)) {
                        output <-
                                c(output,
                                  .data[i,] %>%
                                          unlist() %>%
                                          paste(collapse = ", ")
                                )
                }

                output_colnames <-
                        paste0("~", colnames(.data)) %>%
                        paste(collapse = ",")

                c(output_colnames,
                  output) %>%
                        paste0(collapse = ",\n") %>%
                        cat()


        }


#' @title
#' Make a Formal Argument Skeleton with Default Values
#'
#' @description
#' Retrieve the formal arguments with the default values to copy-and-paste as formal arguments of another function. To copy-and-paste formal arguments as part of an internal function, see \code{\link{makeInternalArgs}}.
#'
#' @param fun PARAM_DESCRIPTION
#'
#' @examples
#' \dontrun{
#' if(interactive()){
#'        makeDefaultArgs(read.csv)
#'  }
#' }
#'
#' @rdname makeDefaultArgs
#'
#' @export

makeDefaultArgs <-
        function(fun) {

                nms <- names(formals(fun))
                values <- unname(formals(fun))

                mapply(paste0, nms, " = ", values) %>%
                        paste(collapse = ",\n") %>%
                        cat()

        }

#' @title
#' Make a Formal Argument Skeleton with Default Values
#'
#' @description
#' Retrieve the formal arguments assigned to itself  to copy-and-paste as an internal function call. To copy-and-paste formal arguments with their default values, see \code{\link{makeDefaultArgs}}.
#'
#' @param fun PARAM_DESCRIPTION
#'
#' @examples
#' \dontrun{
#' if(interactive()){
#'        makeInternalArgs(read.csv)
#'  }
#' }
#'
#' @rdname makeInternalArgs
#'
#' @export

makeInternalArgs <-
        function(fun) {

                nms <- names(formals(fun))
                values <- unname(formals(fun))

                mapply(paste0, nms, " = ", nms) %>%
                        paste(collapse = ",\n") %>%
                        cat()

        }

