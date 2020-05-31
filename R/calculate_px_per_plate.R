#' Title Calculate the Price Per Plate by Recipe
# At the finest detail we will calculate the cost of each ingredient by recipe
#'
#' @param all_plates_df dataframe holding the total number of plates of recipe that will be made
#' @param recipes_df recipes dataframe downloaded from Ronalds googlesheet
#' @param prices historical prices of all the ingredients that go into Ronalds Recipes
#'
#' @return
#' @export
#'
#' @examples
calculate_px_per_plate <- function(all_plates_df, recipes_df ,prices){
  all_plates_df %>%
    left_join(recipes_df, by = c("recipe")) %>%
    left_join(prices, by = c("item")) %>%
    select(-unit_type.x, -date, -selling_px, -no_units, -unit_type.y ) %>%
    mutate(total_cost = (no_dishes * (units/4))*cost_per_unit)
}
