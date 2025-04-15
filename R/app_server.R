#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  thematic::thematic_off()
  mod_random_plot_server("random_plot_1")
  mod_random_plot_server("random_plot_2")
  mod_random_plot_server("random_plot_3")
  mod_random_plot_server("random_plot_4")
}

