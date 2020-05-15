#' Converts all docx files in the working directory to markdown
#' @param docx name of the input docx filename
#' @importFrom rmarkdown pandoc_convert
#' @import devtools
#' @export

docx_to_md <-
        function(input_docx, log = TRUE, log_details = "") {
                if (log == TRUE) {
                        log_this(path_to_file = input_docx,
                                 activity_type = "convert",
                                 details = log_details,
                                 function_used = "docx_to_md")
                }

                rmarkdown::pandoc_convert(input = input_docx,
                                          to="markdown",
                                          output = paste0(strip_fn(input_docx, rm_path = FALSE), ".md"),
                                          options=c("--extract-media=."),
                                          verbose = TRUE)

        }
