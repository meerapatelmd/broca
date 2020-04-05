#' Converts all xlsx files in the working directory to csv
#' @param input_xlsx name of the input xlsx filename
#' @importFrom purrr map2
#' @import dplyr
#' @export

excel_to_csv <-
        function(input_xlsx) {

                data_list <- mirCat::read_entire_excel(full_xlsx_fn = input_xlsx,
                                               log = FALSE)

                xlsx_dir_name <- paste0(dirname(input_xlsx), "/", strip_fn(input_xlsx))
                mirCat::create_dir_if_not_exist(xlsx_dir_name)

                output_fns <- paste0(xlsx_dir_name, "/", names(data_list), ".csv")

                invisible(
                data_list %>%
                        purrr::map2(output_fns, function(x, y) readr::write_csv(x, y)))

        }

