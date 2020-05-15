#' Load log.md as a dataframe
#' @importFrom readr read_tsv
#' @export

load_log <-
        function() {
                readr::read_tsv("log.md")
        }

