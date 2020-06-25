#' Is the file an excel file?
#' @export

is_excel <-
        function(filename) {
                grepl("[.]xlsx$", filename, ignore.case = TRUE)
        }




