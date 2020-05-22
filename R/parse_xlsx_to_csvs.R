#' Parses tabs in an Excel to csvs
#' @description If the Excel is of length 1, it will be inputed into convert_xlsx_to_csv function. The tab names of
#' the Excel file are cleaned up using the rubix::cleanup_listnames function before being pasted into the final csv filename.
#' @param xlsx_fn path to Excel file
#' @param remove If TRUE, xlsx_fn is deleted upon execution.
#' @importFrom rubix cleanup_listnames
#' @importFrom cave strip_fn
#' @export

parse_xlsx_to_csvs <-
        function(xlsx_fn, remove = FALSE) {
                xlsx_data <- read_full_excel(xlsx_fn)
                if (length(xlsx_data) == 1) {
                        convert_xlsx_to_csv(xlsx_file = xlsx_fn,
                                            remove = remove)
                } else {
                        xlsx_data <-
                                xlsx_data %>%
                                rubix::cleanup_listnames()

                        list_names <- names(xlsx_data)

                        new_csv_fns <- paste0(cave::strip_fn(xlsx_fn, rm_path = FALSE), "_", list_names, ".csv")

                        for (i in 1:length(xlsx_data)) {
                                simply_write_csv(x = xlsx_data[[i]],
                                                 file = new_csv_fns[i],
                                                 log_details = paste0("convert tab ", i, " in ", xlsx_fn, " to ", new_csv_fns[i]))
                        }
                        if (remove == TRUE) {
                                file.remove(xlsx_fn)
                        }

                        return(new_csv_fns)
                }

        }
