#' @title
#' View a Dataframe in a Temporary CSV File
#' @description
#' View a dataframe in a csv opened in Excel without having to export to a permanant file.
#'
#' @inheritParams args
#' @inheritParams write_temp_csv
#' @return
#' Path to the temporary filename for unlinking
#' @export

view_as_csv <-
        function(data,
                 na = NA,
                 append = FALSE,
                 col_names = !append,
                 quote_escape = double,
                 eol = "\n",
                 log = "DEPRECATED",
                 log_details = "") {

                temp_fn <- write_temp_csv(x = data,
                                          na = na,
                                          append = append,
                                          col_names = col_names,
                                          quote_escape = quote_escape,
                                          eol = eol)

                system(paste0("open ", temp_fn))

                temp_fn
        }


#' @title
#' View a Dataframe in a Temporary Excel File
#' @description
#' View a dataframe in an Excel opened in Excel without having to export to a permanant file.
#'
#' @inheritParams args
#' @inheritParams write_temp_xlsx
#' @return
#' Path to the temporary filename for unlinking
#' @export
#' @importFrom openxlsx openXL

view_as_xlsx <-
        function(data) {
                temp_fn <- write_temp_xlsx(x = data)
                openxlsx::openXL(temp_fn)
                temp_fn
        }




