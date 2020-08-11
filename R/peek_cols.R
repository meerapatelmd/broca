#' Retrieve Column Names in a Tabular File
#' @description
#' The source file may be an Excel or csv file.
#' @seealso
#'  \code{\link[stringr]{str_replace}}
#' @rdname peek_cols
#' @export
#' @importFrom stringr str_replace_all

peek_cols <-
        function(file,
                 tab = NULL,
                 as_string = FALSE) {

                if (is_excel(file)) {
                        if (is.null(tab)) {
                                stop('tab is missing with no default')
                        }

                        .data <- read_full_excel(full_xlsx_fn = file)
                        cols <- colnames(.data[[tab]])

                } else {
                        .data <- simply_read_csv(path_to_csv = file)
                        cols <- colnames(.data)
                }

                if (as_string) {
                        cols <- as.character(cols)
                        cols <- paste0("'", cols, "'")
                        cols <- paste0("c(", paste(cols, collapse = ", "),
                                           ")")
                        stringr::str_replace_all(cols, "\"", "'")
                } else {
                        cols
                }
        }
