#' Clear log messages
#' @description Clean up log.md by removing all the messages from old work
#' @importFrom dplyr filter
#' @importFrom readr write_tsv
#' @export

clear_log_messages <-
        function() {
                log <- load_log()
                new_log <-
                log %>%
                        dplyr::filter(!(`Activity Type` %in% c("MESSAGE",
                                                             "message",
                                                             "Message")))

                readr::write_tsv(new_log,
                                 path = "log.md")

        }


