#'Writes xlsx to the OUTPUT directory with the option of having the activity logged and guardrails in case the chosen filename already exists
#'@param data dataframe or list object
#'@param file_basename basename of output file
#'@param date_filename if TRUE, appends filename with date and version number
#'@param log if TRUE, logs output in the log
#'@import openxlsx
#'@import crayon
#'@export

write_xlsx_if_not_exist <-
        function(data, file, date_filename = FALSE, version = NULL, log = TRUE, io_comment = "", io_details = "") {

                ## Creating output filename
                if (date_filename == TRUE) {
                        if (is.null(version)) {
                                output_fn <- paste0(strip_fn(file, rm_ext = TRUE, rm_path = FALSE), "_", date_this(without_punct = TRUE), ".xlsx")
                        } else {
                                output_fn <- paste0(strip_fn(file, rm_ext = TRUE, rm_path = FALSE), "_", date_this(without_punct = TRUE), "v", version, ".xlsx")
                        }
                } else {
                        if (is.null(version)) {
                                output_fn <- paste0(strip_fn(file, rm_ext = TRUE, rm_path = FALSE), ".xlsx")
                        } else {
                                output_fn <- paste0(strip_fn(file, rm_ext = TRUE, rm_path = FALSE), "v", version, ".xlsx")
                        }
                }

                ## Writing xlsx if the file does not exist
                if (!(file.exists(output_fn))) {
                                openxlsx::write.xlsx(data, output_fn)
                                typewriteR::tell_me(crayon::red(paste0("Successfully wrote ", output_fn, ".")))
                                if (log == TRUE) {
                                        mirCat::log_this_as(fn = output_fn,
                                                            activity = "output",
                                                            io_comment = io_comment,
                                                            io_details = io_details)
                                }
                        } else {
                                typewriteR::tell_me(output_fn, "already exists.")
                                ans <- readline("Overwrite? [Y/n]: ")
                                if (substr(ans, 1, 1) == "Y") {
                                        openxlsx::write.xlsx(data, output_fn)
                                        typewriteR::tell_me(crayon::red(paste0("Successfully overwrote ", output_fn, ".")))
                                        if (log == TRUE) {
                                                mirCat::log_this_as(fn = output_fn,
                                                                    activity = "output",
                                                                    io_comment = io_comment,
                                                                    io_details = io_details)
                                        }
                                } else {
                                        typewriteR::tell_me(crayon::red(output_fn, "was not overwritten."))
                                }
                        }
        }

