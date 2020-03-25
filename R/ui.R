ui <- dashboardPage(
  
  dashboardHeader(
    title = "sujuiko",
    titleWidth = 350
  ),
  
  dashboardSidebar(
    
    # TODO time parameters module
    #   - Main time parameters
    #   - A/B time parameters
    
    # TODO select mode
    
    # TODO include / exclude routes
    
    # TODO include / exclude links
    
    # TODO download current data
    
    width = 350
    
  ),
  
  dashboardBody(
    
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    
    fluidRow(
      box(
        # TODO measure value boxes
        width = 12,
        collapsible = TRUE
      )
    ),
    
    fluidRow(
      box(
        # TODO leaflet map
        width = 12
      )
    ),
    
    fluidRow(
      tabBox(
        
        tabPanel(
          title = "Space-time plot",
          # TODO space-time plot of selected data
          "plot here"
        ),
        
        tabPanel(
          title = "Data",
          # TODO table of selected data
          "data table here"
        ),
        
        id = "dataTabBox",
        width = 12
        
      )
    )
    
  )
)