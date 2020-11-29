#' A simply write txt to a temp file with a logging feature
#' @description
#' Write a delimited text file to a temporary path. Path to the temporary text file is returned.
#' @importFrom readr write_delim
#' @inheritParams readr::write_delim
#' @rdname write_temp_delim
#' @export
#' @importFrom readr write_delim
#' @family delim functions

write_temp_delim <-
  function(x,
           delim = " ",
           na = NA,
           append = FALSE,
           col_name = !append,
           quote_escape = double,
           eol = "\n",
           log = "DEPRECATED",
           log_details = "") {
    temp_file <- tempfile(fileext = ".txt")

    if (log == TRUE) {
      log_this(
        path_to_file = temp_file,
        activity_type = "write",
        function_used = "write_temp_delim",
        details = log_details
      )
    }

    readr::write_delim(
      x = x,
      file = temp_file,
      delim = delim,
      na = na,
      append = append,
      col_names = col_names,
      quote_escape = quote_escape,
      eol = eol
    )

    return(temp_file)
  }
