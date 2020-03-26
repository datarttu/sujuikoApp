# Placeholder variables:
# replace these with dynamic values later
routes_available <- c(
  "1001 1", "1001 2", "1002 1", "1002 2", "1003 1", "1003 2",
  "1006 1", "1006 2", "1006T 1", "1006T 2", "1007 1", "1007 2"
)

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
    
    # Included / excluded routes.
    # Empty include list means all routes are included.
    
    pickerInput(
      inputId = "routes_selected",
      label = "Routes (no selection = all included)", 
      choices = routes_available, # TODO: replace with dynamic values from database!
      multiple = TRUE,
      options = list(
        `actions-box` = TRUE,
        `live-search` = TRUE,
        `selected-text-format` = "count > 5"
      ),
      width = "100%"
    ),
    
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