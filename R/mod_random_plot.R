#' random_plot UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_random_plot_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h2("A Random Plot"),
    plotOutput(ns("plot"))
  )
}

#' random_plot Server Functions
#'
#' @noRd
mod_random_plot_server <- function(id){
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$plot <- renderPlot({
      shinipsum::random_ggplot()
    })

  })
}

## To be copied in the UI
# mod_random_plot_ui("random_plot_1")

## To be copied in the server
# mod_random_plot_server("random_plot_1")
