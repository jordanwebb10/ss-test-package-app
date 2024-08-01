app_server <- function(input, output, session) {

  # Function to fetch data from database (replace with your actual data retrieval code)
  fetch_data <- function() {

    con <- SportScienceR::create_db_con_ss(schemaName = 'mnt')

    on.exit(dbDisconnect(con))

    tbl(con, "vw_gps_drill") %>%
      select(drill_title, dist) %>%
      group_by(drill_title) %>%
      summarise(dist = mean(dist)) %>%
      filter(!is.na(drill_title)) %>%
      collect(n = 30)

  }

  dat <- fetch_data()

  # Render data table
  output$data_table <- renderDT({
    datatable(dat)
  })

  # Render plot
  output$plot <- renderPlotly({
    plot_ly(dat, x = ~drill_title, y = ~dist, type = "bar")
  })

}
