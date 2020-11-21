#' View data in a temporary csv file
#' @description View a data in a csv opened in Excel without having to export to a permanant file.
#' @return path to the temporary filename for unlinking
#' @export

view_as_csv <-
        function(data) {
                temp_fn <- write_temp_csv(x = data)
                system(paste0("open ", temp_fn))
                return(temp_fn)
        }

#' View data in a temporary csv file
#' @description View a data in a csv opened in Excel without having to export to a permanant file.
#' @return path to the temporary filename for unlinking
#' @importFrom openxlsx openXL
#' @export

view_as_xlsx <-
        function(data) {
                temp_fn <- write_temp_xlsx(x = data)
                openxlsx::openXL(temp_fn)
                return(temp_fn)
        }




