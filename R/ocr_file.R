#' Tesseract's ocr function, but the png outputs are deleted after execution
#' @param pdf_fn full path to the input pdf name
#' @param pages pages to ocr
#' @param txt_fn full path to output txt file
#' @import tesseract
#' @import pdftools
#' @export

ocr_file <-
        function(pdf_fn, pages = NULL, txt_fn) {

                if (is.null(pages)) {
                        len <- pdftools::pdf_length(pdf_fn)
                        for (i in 1:len) {
                                output <- pdftools::pdf_ocr_text(pdf = pdf_fn,
                                                       pages = i)
                                if (i == 1) {
                                        cat(paste0(as.character(Sys.time()), "\t", "File created.\n"), sep = "\n\n", file = txt_fn)
                                        cat(paste0("PAGE ", i), sep = "\n", file = txt_fn, append = TRUE)
                                        cat(output, sep = "\n\n\n", file = txt_fn, append = TRUE)
                                } else {
                                        cat(paste0("PAGE ", i), sep = "\n", file = txt_fn, append = TRUE)
                                        cat(output, sep = "\n\n\n", file = txt_fn, append = TRUE)
                                }

                        }
                } else {
                        for (i in pages) {
                                output <- pdftools::pdf_ocr_text(pdf = pdf_fn,
                                                                 pages = i)
                                if (i == 1) {
                                        cat(paste0(as.character(Sys.time()), "\t", "File created.\n"), sep = "\n\n", file = txt_fn)
                                        cat(paste0("PAGE ", i), sep = "\n", file = txt_fn, append = TRUE)
                                        cat(output, sep = "\n\n\n", file = txt_fn, append = TRUE)
                                } else {
                                        cat(paste0("PAGE ", i), sep = "\n", file = txt_fn, append = TRUE)
                                        cat(output, sep = "\n\n\n", file = txt_fn, append = TRUE)
                                }

                        }
                }
        }
