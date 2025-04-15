#' random_plot UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @import plotly
mod_random_plot_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h2("A Random Plot"),
    plotlyOutput(ns("plot"))
  )
}

#' random_plot Server Functions
#'
#' @noRd
mod_random_plot_server <- function(id){
  moduleServer(id, function(input, output, session) {
    output$plot <- renderPlotly({

      df <- data.frame(
        x = rnorm(100),
        y = rnorm(100)
      )

      # Criando um gráfico com ggplot2
      ggplot(df, aes(x = x, y = y)) +
        geom_point() +
        labs(title = "Gráfico Aleatório", x = "Eixo X", y = "Eixo Y")
    })
  })
}

## To be copied in the UI
# mod_random_plot_ui("random_plot_1")

## To be copied in the server
# mod_random_plot_server("random_plot_1")
