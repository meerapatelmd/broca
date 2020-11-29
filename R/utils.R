#' @title
#' Remove File Extension from String
#' @export
#' @importFrom stringr str_replace


strip_ext <-
  function(file) {
    stringr::str_replace(
      string = file,
      pattern = "(^.*)([.]{1}.*$)",
      replacement = "\\1"
    )
  }




#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL
