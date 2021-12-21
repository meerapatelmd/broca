glue_chunk <-
        function(...,
                 .sep = "",
                 .envir = parent.frame(),
                 .open = "<",
                 .close = ">",
                 .na = "NA",
                 .trim = TRUE) {


                glue::glue(
                        ...,
                        .sep = .sep,
                        .envir = .envir,
                        .open = .open,
                        .close = .close,
                        .na = .na,
                        .trim = .trim)



        }
