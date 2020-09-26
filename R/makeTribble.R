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