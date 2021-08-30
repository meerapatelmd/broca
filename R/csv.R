#' @title
#' Does the file have a csv extension?
#'
#' @description
#' Check if the file has a name that matches the ".csv"
#' file extension pattern.
#'
#' @inheritParams args
#' @rdname is_csv
#' @family logical functions
#' @family csv functions
#' @export

is_csv <-
  function(file) {
    grepl("[.]csv$", file, ignore.case = TRUE)
  }

#' @title
#' Read a CSV as All Text
#'
#' @description
#' Read a CSV with all columns defaulted to "character" data
#' types to prevent parsing failures by
#' \code{\link[readr]{read_csv}}.
#'
#' @importFrom readr read_csv
#' @inheritParams readr::read_csv
#' @rdname simply_read_csv
#' @family csv functions
#' @export
#' @import readr

simply_read_csv <-
  function(file,
           col_names = TRUE,
           col_types = readr::cols(.default = "c"),
           locale = readr::default_locale(),
           na = "NA",
           quoted_na = TRUE,
           quote = "\"",
           comment = "",
           trim_ws = TRUE,
           skip = 0,
           n_max = Inf,
           guess_max = min(1000, n_max),
           progress = show_progress(),
           skip_empty_rows = TRUE,
           log = "DEPRECATED",
           log_details = "") {
    if (log == TRUE) {
      log_this(
        path_to_file = path_to_csv,
        activity_type = "read",
        details = log_details,
        function_used = "simply_read_csv"
      )
    }

    readr::read_csv(
      file = file,
      col_names = col_names,
      col_types = col_types,
      locale = locale,
      na = na,
      quoted_na = quoted_na,
      quote = quote,
      comment = comment,
      trim_ws = trim_ws,
      skip = skip,
      n_max = n_max,
      guess_max = guess_max,
      progress = progress,
      skip_empty_rows = skip_empty_rows
    )
  }





#' @title
#' Write to CSV
#'
#' @description
#' Wrapper to \code{\link[readr]{write_csv}}.
#'
#' @importFrom readr write_csv
#' @inheritParams readr::write_csv
#' @rdname simply_write_csv
#' @family csv functions
#' @export
#' @import readr

simply_write_csv <-
  function(x,
           file,
           na = "",
           append = FALSE,
           col_names = !append,
           quote_escape = "double",
           eol = "\n",
           log = "DEPRECATED",
           log_details = "") {
    if (log == TRUE) {
      log_this(
        path_to_file = file,
        activity_type = "write",
        function_used = "simply_write_csv",
        details = log_details
      )
    }

    readr::write_csv(
      x = x,
      file = file,
      na = na,
      append = append,
      col_names = col_names,
      quote_escape = quote_escape,
      eol = eol
    )
  }





#' @title
#' Write CSV to a Temporary File
#'
#' @description
#' Path to the temp file is returned in console.
#'
#' @inheritParams args
#' @rdname write_temp_csv
#' @family csv functions
#' @export

write_temp_csv <-
  function(x,
           na = NA,
           append = FALSE,
           col_names = !append,
           quote_escape = double,
           eol = "\n") {

    temp_file <- tempfile(fileext = ".csv")

    simply_write_csv(
      x = x,
      file = temp_file,
      na = na,
      append = append,
      col_names = col_names,
      quote_escape = quote_escape,
      eol = eol,
      log = log,
      log_details = log_details
    )

    return(temp_file)
  }
