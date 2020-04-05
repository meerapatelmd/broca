#' Converts all docx files in the working directory to markdown
#' @param docx name of the input docx filename
#' @importFrom rmarkdown pandoc_convert
#' @import devtools
#' @export

word_to_md <-
        function(input_docx) {

                rmarkdown::pandoc_convert(input = input_docx,
                                          to="markdown",
                                          output = paste0(strip_fn(input_docx), ".md"),
                                          options=c("--extract-media=."),
                                          verbose = TRUE)

        }
