server <- function(input, output, session) {
  
  # TODO db connection (pool)
  
  # TODO global parameters (sidebar)
  
  # TODO map
  
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