show_csv.rmd.table <-
        function() {

                cli::cli_h1("Metadata")
                cli::cat_bullet(
                        c(
                        glue::glue("Created On:\t{.self$CreatedOn}"),
                        glue::glue("Modified On:\t{.self$ModifiedOn}"),
                        glue::glue("Filename:\t{.self$Filename}"),
                        glue::glue("Md5Sum:\t{.self$Md5Sum}"),
                        glue::glue("Size:\t\t{prettyunits::pretty_bytes(.self$Size)}",
                                  )),
                        bullet = "en_dash")

                cli::cli_h1("Data")
                self_hux <-
                        huxtable::hux(.self$Value) %>%
                        huxtable::theme_article()

                huxtable::print_screen(ht = self_hux,
                                       colnames = FALSE)


        }


#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param heading_level PARAM_DESCRIPTION, Default: 2
#' @param file PARAM_DESCRIPTION
#' @param options PARAM_DESCRIPTION, Default: NULL
#' @param envir PARAM_DESCRIPTION, Default: parent.frame()
#' @param quiet PARAM_DESCRIPTION, Default: TRUE
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
#'  \code{\link[knitr]{opts_knit}}
#'  \code{\link[glue]{glue}}
#' @rdname knit_asis_rmd_table_metadata
#' @export
#' @importFrom knitr opts_knit
#' @importFrom glue glue

knit_asis_rmd_table_metadata <-
        function(heading_level = 2,
                 file,
                 options = NULL,
                 envir = parent.frame(),
                 quiet = TRUE,
                 ...) {

        csv_rmd_table <-
                read_csv_as_rmd_table(file = file)


        knitr::opts_knit$set(output.dir =
                                     getwd())

        metadata <-
        c(
                glue::glue("{paste(rep('#',heading_level), collapse = '')} Metadata"),
                glue::glue("Created On:\t{csv_rmd_table$CreatedOn}"),
                glue::glue("Modified On:\t{csv_rmd_table$ModifiedOn}"),
                glue::glue("Filename:\t{csv_rmd_table$Filename}"),
                glue::glue("Md5Sum:\t\t{csv_rmd_table$Md5Sum}"),
                glue::glue("Size:\t\t{prettyunits::pretty_bytes(csv_rmd_table$Size)}"),
                "")


        cat(metadata,
            sep = "  \n")
}

#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param heading_level PARAM_DESCRIPTION, Default: 2
#' @param file PARAM_DESCRIPTION
#' @param options PARAM_DESCRIPTION, Default: NULL
#' @param envir PARAM_DESCRIPTION, Default: parent.frame()
#' @param quiet PARAM_DESCRIPTION, Default: TRUE
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
#'  \code{\link[knitr]{opts_knit}},\code{\link[knitr]{knit_child}}
#'  \code{\link[glue]{glue}}
#' @rdname knit_asis_rmd_table_value
#' @export
#' @importFrom knitr opts_knit knit_child
#' @importFrom glue glue

knit_asis_rmd_table_value <-
        function(heading_level = 2,
                 file,
                 options = NULL,
                 envir = parent.frame(),
                 quiet = TRUE,
                 ...) {

                csv_rmd_table <-
                        read_csv_as_rmd_table(file = file)


                knitr::opts_knit$set(output.dir =
                                             getwd())

                text <-
                        c(
                                glue::glue("{paste(rep('#',heading_level), collapse = '')} Value"),
                                "```{r,echo=FALSE}",
                                glue::glue("readr::read_csv('{file}')"),
                                "```",
                                "")


                text_res <-
                knitr::knit_child(
                        text = text,
                        options = options,
                        envir = envir,
                        quiet = quiet,
                        ...)
                cat(text_res,
                    sep = "\n")
        }





rmd.table <-
setRefClass(Class = "rmd.table",
            fields =
                    list(CreatedOn = "POSIXct",
                         ModifiedOn = "POSIXct",
                         Filename = "character",
                         Md5Sum   = "character",
                         Size = "numeric",
                         Value = "data.frame"),
            methods = list(show = show_csv.rmd.table))




#' @title
#' Read a CSV
#'
#' @description
#' Read a CSV with all columns defaulted to "character" data
#' types to prevent parsing failures by
#' \code{\link[readr]{read_csv}}.
#'
#' @importFrom readr read_csv
#' @inheritParams readr::read_csv
#' @rdname read_csv_as_rmd_table
#' @family csv functions
#' @export
#' @import readr

read_csv_as_rmd_table <-
        function(file,
                 col_names = TRUE,
                 col_types = readr::cols(.default = "c"),
                 locale = readr::default_locale(),
                 na = "NA",
                 quote = "\"",
                 comment = "",
                 trim_ws = TRUE,
                 skip = 0,
                 n_max = Inf,
                 guess_max = min(1000, n_max),
                 progress = readr::show_progress(),
                 skip_empty_rows = TRUE) {

                x <-
                readr::read_csv(
                        file = file,
                        col_names = col_names,
                        col_types = col_types,
                        locale = locale,
                        na = na,
                        quote = quote,
                        comment = comment,
                        trim_ws = trim_ws,
                        skip = skip,
                        n_max = n_max,
                        guess_max = guess_max,
                        progress = progress,
                        skip_empty_rows = skip_empty_rows
                )



                new(Class = "rmd.table",
                    CreatedOn = file.info(file)$ctime,
                    ModifiedOn = file.info(file)$mtime,
                    Filename = basename(file),
                    Md5Sum   = tools::md5sum(file),
                    Size = file.info(file)$size,
                    Value = x)
        }
