#' @title
#' Copy a data frame to the clipboard
#'
#' @description
#' (Deprecated) Use \code{\link{copy_cb}} instead.
#' @inheritParams args
#' @rdname copy_to_clipboard
#' @family clipboard functions
#' @export
#' @importFrom utils write.table

copy_to_clipboard <-
        function(data, log = "DEPRECATED", log_details = "") {

                                .Deprecated("copy_cb")
                            clip <- pipe("pbcopy", "wb")
                            utils::write.table(data, clip, sep = "\t", row.names = FALSE)
                            close(clip)

                            if (log == TRUE) {
                                log_this(path_to_file = "",
                                         activity_type = "write",
                                         details = log_details,
                                         function_used = "copy_to_clipboard")
                            }
        }


#' @title
#' Copy a Dataframe to Clipboard
#'
#' @inheritParams args
#' @rdname copy_cb
#' @family clipboard functions
#' @export
#' @importFrom utils write.table
#' @example inst/example/clipboard_functions.R

copy_cb <-
        function(data, log = "DEPRECATED", log_details = "") {


                clip <- pipe("pbcopy", "wb")
                utils::write.table(data, clip, sep = "\t", row.names = FALSE)
                close(clip)

                if (log == TRUE) {
                        log_this(path_to_file = "",
                                 activity_type = "write",
                                 details = log_details,
                                 function_used = "copy_to_clipboard")
                }
        }





#' @title
#' Read a Dataframe from Clipboard
#'
#' @description
#' Data types are double, integer, numeric, and character. All factors are converted to character before the dataframe is returned. If header is false, the dataframe is returned with all the rows and column names in the pattern "V{index}," where "{index}" is the position of the column.
#'
#' @inheritParams args
#' @rdname read_clipboard
#' @family clipboard functions
#' @export
#' @importFrom utils read.table
#' @importFrom dplyr mutate_if
#' @example inst/example/clipboard_functions.R

read_clipboard <-
    function(header = TRUE, log = "DEPRECATED", log_details = "") {
                        if (log == TRUE) {
                            log_this(path_to_file = "",
                                     activity_type = "read",
                                     details = log_details,
                                     function_used = "read_clipboard")
                        }

                            if (header == TRUE) {
                                    utils::read.table(pipe("pbpaste"), sep= "\t", header= TRUE) %>%
                                            dplyr::mutate_if(is.factor, as.character)
                            } else {
                                    utils::read.table(pipe("pbpaste"), sep= "\t", header= FALSE)  %>%
                                            dplyr::mutate_if(is.factor, as.character)
                            }
}

#' @title
#' Read Headerless Data from Clipboard
#'
#' @description
#' Read headerless data from the clipboard. Shortcut for `read_clipboard(header = FALSE)`. To read data with a header from the clipboard, use \code{\link{read_cp}}.
#'
#' @return
#' Dataframe is returned with all the rows and column names in the pattern "V{index}," where "{index}" is the position of the column.
#'
#' @export
#' @rdname read_cb_hl
#' @family clipboard functions
#' @example inst/example/clipboard_functions.R

read_cb_hl <-
        function() {

                read_clipboard(header = FALSE)
        }


#' @title
#' Read Data with Header from Clipboard
#'
#' @description
#' Shortcut for `read_clipboard(header = TRUE)`. To read headerless data from the clipboard, use \code{\link{read_cp_hl}}.
#'
#' @export
#' @rdname read_cb
#' @family clipboard functions
#' @example inst/example/clipboard_functions.R

read_cb <-
        function() {

                read_clipboard(header = TRUE)
        }

#' @title
#' Read Clipboard as Tribble
#'
#' @inheritParams args
#' @export
#' @rdname read_cb_trbl
#' @family clipboard functions
#' @example inst/example/clipboard_functions.R

read_cb_trbl <-
        function(header = TRUE, quote = "\"") {

                read_clipboard(header = header) %>%
                        make_trbl(quote = quote)

        }


