#' Is the file an csv file?
#' @export

is_csv <-
        function(filename) {
                grepl("[.]csv$", filename, ignore.case = TRUE)
        }




