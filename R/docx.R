#' Converts all docx files in the working directory to markdown
#' @param docx name of the input docx filename
#' @importFrom rmarkdown pandoc_convert
#' @export

docx_to_gfm <-
        function(docx, log = TRUE, log_details = "") {

                if (log == TRUE) {
                        log_this(path_to_file = docx,
                                 activity_type = "convert",
                                 details = log_details,
                                 function_used = "docx_to_gfm")
                }

                rmarkdown::pandoc_convert(input = docx,
                                          to="gfm",
                                          output = paste0(strip_ext(docx, rm_path = FALSE), ".md"),
                                          options=c("--extract-media=."),
                                          verbose = TRUE)

        }





#' Converts all docx files in the working directory to markdown
#' @param docx name of the input docx filename
#' @importFrom rmarkdown pandoc_convert
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
                                          output = paste0(strip_ext(input_docx, rm_path = FALSE), ".md"),
                                          options=c("--extract-media=."),
                                          verbose = TRUE)

        }





#' Converts all docx files in the working directory to markdown
#' @param input_docx name of the input docx filename
#' @importFrom rmarkdown pandoc_convert
#' @export

docx_to_rmd <-
        function(input_docx, log = TRUE, log_details = "") {

                if (log == TRUE) {
                        log_this(path_to_file = input_docx,
                                 activity_type = "convert",
                                 details = log_details,
                                 function_used = "docx_to_rmd")
                }

                rmarkdown::pandoc_convert(input = input_docx,
                                          to="markdown",
                                          output = paste0(strip_ext(input_docx, rm_path = FALSE), ".rmd"),
                                          options=c("--extract-media=."),
                                          verbose = TRUE)

        }





