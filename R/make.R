#' @title
#' Make a tribble skeleton
#' @inheritParams args
#' @seealso
#'  \code{\link[dplyr]{mutate_if}}
#' @rdname make_trbl
#' @export
#' @importFrom dplyr mutate_ifl

make_trbl <-
        function(data, quote = "\"") {

                data <-
                        data %>%
                        dplyr::mutate_if(is.factor, as.character) %>%
                        dplyr::mutate_if(is.character, ~ sprintf("%s%s%s", quote, ., quote))

                output <- vector()
                for (i in 1:nrow(data)) {
                        output <-
                                c(output,
                                  data[i,] %>%
                                          unlist() %>%
                                          paste(collapse = ", ")
                                )
                }

                output_colnames <-
                        paste0("~", colnames(data)) %>%
                        paste(collapse = ",")

                c("tibble::tribble(",
                  output_colnames,
                  output,
                  ")") %>%
                        paste0(collapse = ",\n") %>%
                        cat()


        }
