#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION

#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[xlsx]{Workbook}}
#' @rdname makeXL
#' @export
#' @importFrom xlsx createWorkbook

makeXL <-
        function() {

                xlsx::createWorkbook(type="xlsx")

        }




#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param file PARAM_DESCRIPTION
#' @param ... PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[xlsx]{write.xlsx}}
#' @rdname xlsx.writeMultipleData
#' @export
#' @importFrom xlsx write.xlsx

xlsx.writeMultipleData <- function (file, ...)
{
        objects <- list(...)
        fargs <- as.list(match.call(expand.dots = TRUE))
        objnames <- as.character(fargs)[-c(1, 2)]
        nobjects <- length(objects)
        for (i in 1:nobjects) {
                if (i == 1) {
                        xlsx::write.xlsx(objects[[i]], file, sheetName = objnames[i])
                } else {
                        xlsx::write.xlsx(objects[[i]], file, sheetName = objnames[i],
                                append = TRUE)
                }
        }
}