







detect_name_error <-
        function(file) {

        if (is_csv(file = file)) {

                output <- list()
                output[[1]] <- simply_read_csv(file = file)
                names(output)[1] <- basename(file)

        } else {

                output <- read_full_excel(file = file)

        }


        results <- list()
        for (i in 1:length(output)) {

                tab <- output[[i]]
                name_error_rows <-
                        tab %>%
                        dplyr::filter_all(
                          dplyr::any_vars(
                                  . == "#NAME?"
                          ))

                results[[i]] <- nrow(name_error_rows) > 0
                names(results)[i] <- names(output)[i]

        }

        results

        }


