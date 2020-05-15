#' View dataframe in a temporary csv file
#' @description View a dataframe in a csv opened in Excel without having to export to a permanant file.
#' @return path to the temporary filename for unlinking
#' @importFrom openxlsx openXL
#' @export

view_as_xlsx <-
        function(dataframe) {
                temp_fn <- write_temp_xlsx(x = dataframe)
                openxlsx::openXL(temp_fn)
                return(temp_fn)
        }