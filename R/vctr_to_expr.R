vctr_to_expr <-
        function(arg_name,
                 arg_value) {

                if ("character" %in% class(arg_value)) {

                        if (length(arg_value) > 1) {
                                output_expr <-
                                        glue::glue("{arg_name} = {easyBakeOven::vctr_to_str(arg_value)}")
                        } else {

                                output_expr <-
                                        glue::glue("{arg_name} = '{arg_value}'")

                        }


                } else {

                        if (length(arg_value) > 1) {
                                output_expr <-
                                        glue::glue("{arg_name} = c({paste(arg_value, collapse = ',')})")

                        } else {
                                output_expr <-
                                        glue::glue("{arg_name} = {arg_value}")

                        }


                }

                output_expr
        }
