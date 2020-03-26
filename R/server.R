server <- function(input, output, session) {
  
  # TODO db connection (pool)
  
  # TODO global parameters (sidebar)
  
  # TODO Track current analysis parameters vs current results
  
  # TODO "Run / update" button action
  
  # Network map, basic elements
  output$nw_map <- leaflet::renderLeaflet({
    leaflet::leaflet() %>%
      leaflet::addProviderTiles(leaflet::providers$Esri.WorldGrayCanvas) %>%
      leaflet::setView(24.938, 60.232, 11)
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