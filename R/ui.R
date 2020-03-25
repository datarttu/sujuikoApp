ui <- dashboardPage(
  
  dashboardHeader(
    title = "sujuiko",
    titleWidth = 350
  ),
  
  dashboardSidebar(
    
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    
    # Time parameters.
    # We may want to make this into a separate module
    # if we implement A/B comparison features at some point.
    dateRangeInput(
      inputId = "daterange",
      label = "Start and end (inclusive) dates",
      start = "2019-11-01",
      end = "2019-11-30",
      min = "2019-11-01",
      max = "2019-11-30",
      format = "d.m.yyyy",
      separator = "-",
      width = "100%"
    ),
    
    checkboxGroupButtons(
      inputId = "weekdays",
      label = "Weekdays",
      choices = c(
        "Mon" = 1,
        "Tue" = 2,
        "Wed" = 3,
        "Thu" = 4,
        "Fri" = 5,
        "Sat" = 6,
        "Sun" = 7
      ),
      selected = 1:7,
      justified = TRUE
    ),
    
    sliderInput(
      inputId = "timerange",
      label = "Start and end (exclusive) hours",
      min = 0,
      max = 24,
      value = c(0, 24),
      step = 1,
      ticks = FALSE,
      width = "100%"
    ),
    
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