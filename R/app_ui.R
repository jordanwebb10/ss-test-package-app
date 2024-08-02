#' @export
app_ui <- function(){
  dashboardPage(
    dashboardHeader(title = "Database Viewer"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
      )
    ),
    dashboardBody(
      tabItems(
        tabItem(
          tabName = "dashboard",
          fluidRow(
            box(
              width = 12,
              title = "Data Table",
              solidHeader = TRUE,
              status = "primary",
              DTOutput("data_table")
            )
          ),
          fluidRow(
            box(
              width = 12,
              title = "Plot",
              solidHeader = TRUE,
              status = "primary",
              plotlyOutput("plot")
            )
          )
        )
      )
    )
  )
}
