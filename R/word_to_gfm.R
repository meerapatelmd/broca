#' Converts all docx files in the working directory to markdown
#' @param docx name of the input docx filename
#' @importFrom rmarkdown pandoc_convert
#' @import devtools
#' @export

word_to_gfm <-
        function(docx) {

                rmarkdown::pandoc_convert(input = docx,
                                          to="gfm",
                                          output = paste0(strip_fn(docx), ".md"),
                                          options=c("--extract-media=."),
                                          verbose = TRUE)

        }
