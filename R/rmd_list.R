



rmd_dt_list <-
  function(list,
           header_level = 2,
           expr_only = FALSE,
           max_rows = 50,
           ...) {


    if (is.null(names(list))) {
      stop("`list` names are needed for headers!")
    }

    listName <- deparse(substitute(list))
    header <- rep("#", header_level)
    header <- paste(header, collapse = "")


    additional_args <- !missing(...)

    if (additional_args) {

      datatable_args <-
        rlang::list2(...)
      datatable_arg_expr <-
        capture_args_as_expr(datatable_args)

    }


    output_expr <- list()

    if (additional_args) {
      for (i in seq_along(list)) {

        header_content <- names(list)[i]
        output_expr[[i]] <-
          c(glue_chunk("<header> <header_content>  "),
            "",
            if (nrow(list[[i]]) <= max_rows) {
              glue_chunk("```{r,echo=FALSE,eval=TRUE}",
                         "DT::datatable(\n<listName>[[<i>]],\n<datatable_arg_expr>)",
                         "```",
                         .sep = "\n")
            } else {
              glue_chunk("Only the first <max_rows> row/s shown. Total row count is <nrow(list[[i]])>.  ",
                         "",
                         "```{r,echo=FALSE,eval=TRUE}",
                         "DT::datatable(\n<listName>[[<i>]][1:<max_rows>,],\n<datatable_arg_expr>)",
                         "```",
                         .sep = "\n")
            })
      }

    } else {

      for (i in seq_along(list)) {

        header_content <- names(list)[i]
        output_expr[[i]] <-
          c(glue_chunk("<header> <header_content>  "),
            "",
            if (nrow(list[[i]]) <= max_rows) {
              glue_chunk("```{r,echo=FALSE,eval=TRUE}",
                         "DT::datatable(\n<listName>[[<i>]])",
                         "```",
                         .sep = "\n")
            } else {
              glue_chunk("Only the first <max_rows> row/s shown. Total row count is <nrow(list[[i]])>.  ",
                         "\n",
                         "```{r,echo=FALSE,eval=TRUE}",
                         "DT::datatable(\n<listName>[[<i>]][1:<max_rows>,])",
                         "```",
                         .sep = "\n")
            },
            "\n")
      }


    }

    output_expr <-
      unlist(output_expr) %>%
      paste(collapse = "  \n")

    if (expr_only) {
      return(output_expr)

    }

    # child_rmd <- file.path(child_rmd_folder,
    #                        child_rmd_file)


    child_rmd <- tempfile(fileext = ".Rmd")

    cat(output_expr,
        file = child_rmd)

    res <-
      knitr::knit_child(
        text =
          c(sprintf("```{r,child='%s'}", child_rmd),
            "```"),
        quiet = TRUE,
        envir = parent.frame()
      )

    unlink(child_rmd)

    cat(res)


  }


rmd_dt_list_std <-
  function(list,
           max_rows = Inf) {
    rmd_dt_list(list = list,
                max_rows = max_rows,
                rownames = FALSE,
                filter =  "top",
                extensions =  "Buttons",
                options = list(
                  dom =  "Blfrtip",
                  buttons =  c("copy", "csv", "excel", "pdf", "print"),
                  lengthMenu = list(
                    c(10, 25, 50, -1),
                    c("10", "25", "50", "All")
                  )
                ))
  }

