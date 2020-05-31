#' Get Recipes
#'
#' Get data from Ronalds Recipes Spreadsheet using googlesheets4
#' Ronalds Recipe Sheets hold all information relating to his catering business
#'
#' @param recipe_ss_url The url of the googlesheet - you must ensure that it is publicly readable
#' @param sheet_name The name of the sheet
#'
#' @return
#' @export
#'
#' @examples
get_data_from_sheet <- function(recipe_ss_url, sheet_name){
  gs4_deauth()
  data_from_recipe_sheet <- sheets_read(recipe_ss_url, sheet = sheet_name)
  data_from_recipe_sheet
}
