#'Writes csv to the OUTPUT directory with the option of having the activity logged and guardrails in case the chosen filename already exists
#'@param data dataframe or list object
#'@param file_basename basename of output file
#'@param date_filename if TRUE, appends filename with date and version number
#'@param log if TRUE, logs output in the log
#'@import readr
#'@import crayon
#'@export

write_csv_if_not_exist <-
        function(data, file, date_filename = FALSE, version = NULL, log = TRUE, log_comment = "") {

                ## Creating output filename
                if (date_filename == TRUE) {
                        if (is.null(version)) {
                                output_fn <- paste0(strip_fn(file, rm_ext = TRUE, rm_path = FALSE), "_", date_this(without_punct = TRUE), ".csv")
                        } else {
                                output_fn <- paste0(strip_fn(file, rm_ext = TRUE, rm_path = FALSE), "_", date_this(without_punct = TRUE), "v", version, ".csv")
                        }
                } else {
                        if (is.null(version)) {
                                output_fn <- paste0(strip_fn(file, rm_ext = TRUE, rm_path = FALSE), ".csv")
                        } else {
                                output_fn <- paste0(strip_fn(file, rm_ext = TRUE, rm_path = FALSE), "v", version, ".csv")
                        }
                }

                ## Writing csv if the file does not exist
                if (!(file.exists(output_fn))) {
                                readr::write_csv(data, output_fn)
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
                                        readr::write_csv(data, output_fn)
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

