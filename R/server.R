server <- function(input, output, session) {
  
  # Connect to database.
  # TODO  Wrap inside withProgress?
  # TODO  Add support for different database users.
  dbpool <- pool::dbPool(
    drv = RPostgreSQL::PostgreSQL(),
    host = Sys.getenv("DBHOST"),
    port = Sys.getenv("DBPORT"),
    dbname = Sys.getenv("DBNAME"),
    user = Sys.getenv("DBUSER"),
    password = Sys.getenv("DBPASSWORD"),
    idleTimeout = 3600000
  )
  
  # TODO global parameters (sidebar)
  
  # TODO Track current analysis parameters vs current results
  
  # TODO "Run / update" button action
  
  # Get base network.
  # TODO  Use production network with required fields.
  df_base_nw <- sf::st_read(
    dsn = dbpool,
    query = "
    SELECT edge, subid, mode, oneway, 
      ST_Transform(geom, 4326) AS geom 
    FROM test_split 
    WHERE mode = 'tram'::mode_type;
    "
  )
  
  # Network map, basic elements
  output$nw_map <- leaflet::renderLeaflet({
    leaflet::leaflet() %>%
      leaflet::addProviderTiles(leaflet::providers$Esri.WorldGrayCanvas) %>%
      leaflet::setView(24.938, 60.232, 11) %>%
      leaflet::addPolylines(
        data = df_base_nw,
        color = "#00985f",
        weight = 2,
        label = ~sprintf("%d-%d, oneway: %s",
                         edge, subid, oneway)
      )
  })
  
  # Basic observation statistics of the results on the top row.
  # TODO Replace these placeholder values with dynamic ones from the results
  output$values_basic_stats <- renderUI(
    tags$table(
      tags$tr(HTML("<td><h3>574 </h3></td><td>scheduled trips</td>")),
      tags$tr(HTML("<td><h3>512 </h3></td><td>observed trips</td>")),
      tags$tr(HTML("<td><h3>89 % </h3></td><td>observation coverage</td>"))
    )
  )
  
  # Value boxes of the results on the top row.
  # TODO Make the values dynamic,
  # TODO Set the box color according to the value.
  # TODO Enable changing the earliness / lateness thresholds.
  output$values_otp_early <- renderValueBox({
    valueBox(
      value = "4 %",
      subtitle = "early departures (< 0 s)",
      icon = icon("hourglass-start"),
      color = "green"
    )
  })
  
  output$values_otp_late <- renderValueBox({
    valueBox(
      value = "32 %",
      subtitle = "late departures (> 2 min)",
      icon = icon("hourglass-end"),
      color = "orange"
    )
  })
  
  output$values_drivetime_adherence <- renderValueBox({
    valueBox(
      value = "79 %",
      subtitle = "stop-to-stop times longer than scheduled",
      icon = icon("stopwatch"),
      color = "red"
    )
  })
  
  # TODO selected measure value boxes
  
  # TODO plot
  
  # TODO data table
  
  # TODO download selected data
  
  output$placeholder <- renderText("test text")
  
  session$onSessionEnded(function() {
    # TODO pool close
    stopApp()
  })
  
}