capture_args_as_expr <-
        function(arguments) {

                output <-
                        tibble::tibble(
                                raw_json =
                                        capture.output(
                                                jsonlite::toJSON(x = arguments,
                                                                 pretty = TRUE,
                                                                 auto_unbox = TRUE))) %>%
                        mutate(is_vector = grepl(pattern = "\\[.*?\\]",
                                                 x = raw_json)) %>%
                        mutate(json_1 =
                                       case_when(is_vector == TRUE ~ str_replace(raw_json, "\\[", "c("))) %>%
                        mutate(json_1 =
                                       case_when(is_vector == TRUE ~ str_replace(json_1, "\\]", ")"))) %>%
                        mutate(json_1 =
                                       case_when(is_vector == TRUE ~ str_replace(json_1, "\\:", " = "))) %>%
                        mutate(is_list = is_vector == FALSE & grepl(pattern = "[:]{1} [{[]{1}",
                                                                    x = raw_json)) %>%
                        mutate(json_1 =
                                       case_when(is_list == TRUE ~ str_replace(raw_json, ":.*$", " = list("),
                                                 TRUE ~ json_1))

                str_replace_etc <-
                        function(x) {

                                x <-
                                        str_replace(string = x,
                                                    pattern = "\\[|[{]",
                                                    replacement = "(")

                                x <-
                                        str_replace(string = x,
                                                    pattern = "\\]|[}]",
                                                    replacement = ")")

                                x <- str_replace(string = x,
                                                 pattern = "[:]",
                                                 replacement = " = ")

                                x



                        }

                output <-
                        output %>%
                        mutate(json_1 =
                                       case_when(is.na(json_1) ~ str_replace_etc(raw_json),
                                                 TRUE ~ json_1)) %>%
                        mutate(json_1 = str_replace_all(string = json_1,
                                                        pattern = "false",
                                                        replacement = "FALSE")) %>%
                        mutate(json_1 = str_replace_all(string = json_1,
                                                        pattern = "true",
                                                        replacement = "TRUE"))


                final_expr <-
                        output$json_1[2:(length(output$json_1)-1)]

                final_expr %>%
                        paste(collapse = "\n")



        }
