#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import bs4Dash
#' @import plotly
#' @import leaflet
#' @import DT
#' @noRd

plot_colour <- "#007bff"

# User Interface ----------------------------------------------------------

# UI do dashboard: Observações de Aves em Melbourne
app_ui <-

  #golem_add_external_resources()

  dashboardPage(

  # Título da aba do navegador
  title = "Dashboard CRAS Maringá",

  # Tema customizado (definido previamente)
  #freshTheme = theme,

  # Não está ativando modo escuro, ajuda ou botões extras aqui
  dark = TRUE,
  #help = NULL,

  # Habilita botão de tela cheia e botão "voltar ao topo"
  fullscreen = TRUE,
  scrollToTop = TRUE,

  # ============================
  # HEADER - Cabeçalho Superior
  # ============================
  header = dashboardHeader(
    status = "danger",  # Cor do cabeçalho

    # Marca personalizada com título e imagem
    title = dashboardBrand(
      title = "CRAS",
      color = "danger",
      # COLOCAR UMA IMAGEM DO SISTEMA BAIXADA
      image = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqWSukKsJcWw8ld-9tqErO8SBxqOEUrOR6Nztj4MZBsiwzz9gKXw6WG3-lobYf0Ut1txY&usqp=CAU"
    ),

    # Ícone da barra de controle
    #controlbarIcon = icon("circle-info"),

    fixed = TRUE,  # Cabeçalho fixo no topo

    # Menu suspenso com notificações no canto superior direito
    rightUi = dropdownMenu(
      badgeStatus = "info",
      type = "notifications",
      notificationItem(
        text = "Success",
        status = "success",
        icon = icon("circle-check")
      ),
      notificationItem(
        text = "Warning",
        status = "warning",
        icon = icon("circle-exclamation")
      ),
      notificationItem(
        text = "Error",
        status = "danger",
        icon = icon("circle-xmark")
      )
    )
  ),

  # ========================
  # SIDEBAR - Menu Lateral
  # ========================
  sidebar = dashboardSidebar(
    sidebarMenu(
      id = "sidebarMenuid",

      # Menu com duas abas: Home e Dashboard
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Dashboard", tabName = "dashboard", icon = icon("bar-chart")),
      menuItem("Indicadores dos Territórios", tabName ="Indicadores dos Territórios", icon =icon("location-dot"))
    )
  ),

  # =============================
  # CONTROLBAR - Barra lateral direita (vazia aqui)
  # =============================
  controlbar = dashboardControlbar(),

  # ===============
  # FOOTER - Rodapé
  # ===============
  footer = dashboardFooter(
    left = a(
      href = "",
      target = "_blank", "@Estats Consultoria"
    ),  # Nome do autor
    right = "2025"             # Ano
  ),

  # ========================
  # BODY - Conteúdo Principal
  # ========================
  body = dashboardBody(
    tabItems(

      tabItem(
        tabName = "home",
        jumbotron(
          title = "Bem Vindo!",
          status = "danger",
          lead = "Esse é o Dashboard dos Dados do CRAS com informações e insights como:   ----"
        ),
        fluidRow(
          userBox(
            collapsible = FALSE,
            title = userDescription(
              title = "Daniel Alexandre Ramazzotte",
              subtitle = "Estatístico",
              image = "https://yt3.googleusercontent.com/kABO8qsiX0FKrvAsjdbU8q98mxSydtE4vpwu03omQ-WtRli9Lo1OTlDhjN05FNsUof2YhuHYvQ=s176-c-k-c0x00ffffff-no-rj",
              type = 1
            ),
            status = "danger",
            "Lindo gostoso"
          ),
          box(
            title = "Como Chico diria...",
            width = 6,
            collapsible = FALSE,
            blockQuote(
              "O meu amor tem um jeito manso que é só seu
E que me deixa louca quando me beija a boca
A minha pele toda fica arrepiada
E me beija com calma e fundo
Até minh'alma se sentir beijada",
              color = "danger"
            )
          )
        )
      ),

      tabItem(
        tabName = "dashboard",
        fluidRow(
          column(width = 4),
          column(width = 4),
          column(width = 4)
        ),
        fluidRow(
          sortable(
            width = 6,
            box(
              title = "GRAFICO",
              width = 12,
              status = "danger",
              collapsible = FALSE,
              ribbon(text = "NEW", color = "danger")
            ),
            box(
              title = "GRAFICO",
              width = 12,
              closable = TRUE,
              status = "danger"
            )
          ),
          sortable(
            width = 6,
            box(
              title = "GRAFICO",
              width = 12,
              status = "danger",
              collapsible = FALSE,
              maximizable = TRUE
            ),
            box(
              title = "GRAFICO",
              width = 12,
              status = "danger",
              collapsible = FALSE,
              label = boxLabel(
                text = "Label",
                status = "danger",
                tooltip = "I'm a label!"
              ),
              sidebar = boxSidebar(
                id = "boxsidebarid",
                numericInput(
                  inputId = "show_top_n",
                  label = "Show Top N",
                  value = 6,
                  min = 1,
                  max = 50,
                  width = "97%"
                )
              )
            )
          )
        ),
        tabBox(
          title = "Data",
          width = 12,
          type = "tabs",
          status = "danger",
          solidHeader = TRUE
        )
      ),

      tabItem(
        tabName = "Indicadores dos Territórios",
        fluidRow(
          box(
            title = "Mapa ",
            width = 12,
            status = "success",
            solidHeader = TRUE,
            collapsible = TRUE,
            leafletOutput("leaflet_mapa", height = "600px")
          )
        )
      )

    )
  )
)

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "dashboard.CRAS.Maringa"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}


