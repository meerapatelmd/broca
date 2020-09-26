#' @title
#' Strip Extension
#' @export



strip_ext <-
        function(file) {

                stringr::str_replace(string = file,
                                    pattern = "(^.*)([.]{1}.*$)",
                                    replacement = "\\1")
        }