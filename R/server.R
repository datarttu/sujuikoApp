server <- function(input, output, session) {
  
  # TODO db connection (pool)
  
  # TODO global parameters (sidebar)
  
  # Network map, basic elements
  output$nw_map <- leaflet::renderLeaflet({
    leaflet::leaflet() %>%
      leaflet::addProviderTiles(leaflet::providers$Esri.WorldGrayCanvas) %>%
      leaflet::setView(24.938, 60.232, 11)
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