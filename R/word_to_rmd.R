#' Converts all docx files in the working directory to markdown
#' @param input_docx name of the input docx filename
#' @importFrom rmarkdown pandoc_convert
#' @import devtools
#' @export

convert_docx_to_rmd <-
        function(input_docx) {

                rmarkdown::pandoc_convert(input = input_docx,
                                          to="markdown",
                                          output = paste0(strip_fn(input_docx), ".rmd"),
                                          options=c("--extract-media=."),
                                          verbose = TRUE)

        }
