#' Function to generate a shopping list for Ronald
#' The output is a dataframe
#'
#' @param all_plates_df Dataframe holding the total number of plates of recipe that will be made
#' @param recipe_df Recipes dataframe downloaded from Ronalds googlesheet
#'
#' @return
#' @export
#'
#' @examples
generate_shopping_list <- function(all_plates_df, recipe_df){
  recipe_df %>%
    # join the all_plates with the recipe
    left_join(all_plates_df, by = c("recipe")) %>%
    # calculate the total number of unit of each ingredient you need
    mutate(total_units = units * no_dishes)  %>%
    # group and summarize what you have
    group_by(item, unit_type) %>%
    summarise(total_units = sum(total_units))
}
