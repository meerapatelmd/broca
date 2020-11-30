#' @title
#' Google Suite
#'
#' @param drive_path    Dribble, url, or id passed as `path` to the `googledrive package` functions`
#'
#' @name google
NULL

#' @title
#' Read Google Doc as Officer Package Object
#'
#' @importFrom googledrive drive_get drive_download
#' @importFrom officer read_docx
#'
#' @export
#' @rdname read_gdoc_as_docx
#' @inheritParams google

read_gdoc_as_docx <-
        function(drive_path) {


                file_info <- googledrive::drive_get(id = drive_path)

                if (file_info$drive_resource[[1]]$mimeType != "application/vnd.google-apps.document") {

                        stop(sprintf("drive_path '%s' is not a document", drive_path), call. = FALSE)


                }

                temp_file <- tempfile(fileext = ".docx")
                on.exit(unlink(temp_file))

                googledrive::drive_download(
                        file = drive_path,
                        path = temp_file,
                        verbose = TRUE
                )


                officer::read_docx(path = temp_file)

        }

#' @title
#' Read Google Doc as Text
#'
#' @importFrom googledrive drive_get drive_download
#'
#' @export
#' @rdname read_gdoc_as_txt
#' @inheritParams google

read_gdoc_as_txt <-
        function(drive_path) {


                file_info <- googledrive::drive_get(id = drive_path)

                if (file_info$drive_resource[[1]]$mimeType != "application/vnd.google-apps.document") {

                        stop(sprintf("drive_path '%s' is not a document", drive_path), call. = FALSE)


                }

                temp_file <- tempfile(fileext = ".txt")
                on.exit(unlink(temp_file))

                googledrive::drive_download(
                        file = drive_path,
                        path = temp_file,
                        verbose = TRUE
                )


                readLines(temp_file)

        }

#' @title
#' Read a Google Sheet
#'
#' @description
#' The Google Sheet is downloaded and read as a temporary Excel file. Arguments other than `drive_path` are passed to \code{\link{read_full_excel}}.
#'
#' @inheritParams google
#' @inheritParams read_full_excel
#' @export
#' @importFrom googledrive drive_get drive_download
#' @importFrom readxl excel_sheets read_excel
#' @importFrom purrr set_names map
#' @rdname read_gsheet

read_gsheet <-
        function(drive_path,
                 col_names = TRUE,
                 col_types = "text",
                 na = "",
                 trim_ws = TRUE,
                 skip = 0,
                 n_max = Inf,
                 guess_max = min(1000, n_max),
                 progress = readxl_progress(),
                 .name_repair = "unique") {


                file_info <- googledrive::drive_get(id = drive_path)

                if (file_info$drive_resource[[1]]$mimeType != "application/vnd.google-apps.spreadsheet") {

                        stop(sprintf("drive_path '%s' is not a spreadsheet", drive_path), call. = FALSE)


                }

                temp_file <- tempfile(fileext = ".xlsx")
                on.exit(unlink(temp_file))

                googledrive::drive_download(
                        file = drive_path,
                        path = temp_file,
                        verbose = TRUE
                )

                        read_full_excel(file = temp_file,
                                        col_names = col_names,
                                        col_types = col_types,
                                        na = na,
                                        trim_ws = trim_ws,
                                        skip = skip,
                                        n_max = n_max,
                                        guess_max = guess_max,
                                        progress = progress,
                                        .name_repair = .name_repair)


        }




view_as_gsheet <-
        function(x) {

                ss <- googlesheets4::gs4_create(name = gs4_random())
                googledrive::drive_mv(file = ss,
                                      path = "tmp_sheets")

                if (is.data.frame(x)) {

                        x <- list(x)
                        names(x)[1] <- "Sheet1"

                }

                sheets <- names(x)

                sheets %>%
                        purrr::map2(x,
                                    function(.x,.y)
                                            googlesheets4::write_sheet(data = .y,
                                                                       ss = ss,
                                                                       sheet = .x))

        }
