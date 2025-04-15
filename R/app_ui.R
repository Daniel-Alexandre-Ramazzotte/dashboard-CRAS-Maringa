app_ui <- bs4DashPage(
  header = bs4DashNavbar(),
  sidebar = bs4DashSidebar(
    title = "Título",
    bs4SidebarMenu(
      bs4SidebarMenuItem(
        "Dashboard",
        tabName = "dashboard"
      ),
      bs4SidebarMenuItem(
        "Mapa",
        tabName = "mapa"
      )
    )
  ),
  body = bs4DashBody(
    bs4TabItems(
      bs4TabItem(
        tabName = "dashboard",
        fluidRow(
          box(
            mod_random_plot_ui("random_plot_1")
          )
        )
      ),
      bs4TabItem(
        tabName = "mapa",
        h3("Mapa aqui...")  # Placeholder caso queira usar depois
      )
    )
  )
)
