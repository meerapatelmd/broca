#' View In Temporary CSV File
#' @description
#' View a data in a csv opened in Excel without having to export to a permanant file.
#' @return path to the temporary filename for unlinking
#' @export

view_as_csv <-
        function(data) {
                temp_fn <- write_temp_csv(x = data)
                system(paste0("open ", temp_fn))
                temp_fn
        }


#' View in Temporary Excel File
#' @description
#' Write the data to a temporary xlsx file and open in Excel.
#'
#' @return
#' Path to the temporary filename for unlinking
#' @importFrom openxlsx openXL
#' @export

view_as_xlsx <-
        function(data) {
                temp_fn <- write_temp_xlsx(x = data)
                openxlsx::openXL(temp_fn)
                temp_fn
        }




