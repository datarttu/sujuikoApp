# Placeholder variables:
# replace these with dynamic values later
routes_available <- c(
  "1001 1", "1001 2", "1002 1", "1002 2", "1003 1", "1003 2",
  "1006 1", "1006 2", "1006T 1", "1006T 2", "1007 1", "1007 2"
)
stops_available <- c(
  "6120216 Haapajärvi" = 6120216,
  "1431109 Kettulehto" = 1431109,
  "2612201 Luhtaniitty" = 2612201,
  "2712202 Brödtorp" = 2712202,
  "1180121 Auroran sairaala" = 1180121,
  "1173107 Vaihdemiehenkatu" = 1173107,
  "1100128 Polariksenkatu" = 1100128,
  "2412229 Soukantori" = 2412229,
  "1220430 Kotkankatu" = 1220430,
  "1492151 Kellaripellonpolku" = 1492151
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
    
    tags$br(),
    
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
    
    tags$br(),
    
    # TODO select mode
    
    # Included / excluded routes.
    # Empty include list means all routes are included.
    
    pickerInput(
      inputId = "routes_selected",
      label = "Routes (no selection = all included)", 
      choices = routes_available, # TODO Replace with dynamic values from database
      multiple = TRUE,
      options = list(
        `actions-box` = TRUE,
        `live-search` = TRUE,
        `selected-text-format` = "count > 5"
      ),
      width = "100%"
    ),
    
    tags$br(),
    
    # Stop-to-stop filter:
    # a) If only start OR end stops are selected,
    #    include routes that go through any of the selected stops.
    # b) If both start AND end stops are selected,
    #    include routes that go through any of the start stops
    #    and then go through any of the end stops (in this order).
    # TODO In case b), should we only load the segments between the selected stops,
    #      or all the data for those routes?
    #      The first option is tricky for multiple dep and arr stops.
    #      At least we should highlight the stop nodes on the map.
    pickerInput(
      inputId = "dep_stops_selected",
      label = "Departing from any of these stops",
      choices = stops_available, # TODO Replace with dynamic values from database
      multiple = TRUE,
      options = list(
        `actions-box` = TRUE,
        `live-search` = TRUE,
        `selected-text-format` = "count > 2"
      ),
      width = "100%"
    ),
    
    pickerInput(
      inputId = "arr_stops_selected",
      label = "Arriving at any of these stops",
      choices = stops_available, # TODO Replace with dynamic values from database
      multiple = TRUE,
      options = list(
        `actions-box` = TRUE,
        `live-search` = TRUE,
        `selected-text-format` = "count > 2"
      ),
      width = "100%"
    ),
    
    tags$br(),
    
    # Data is updated only after clicking this button.
    # TODO  The button should be updated like this:
    #       a) Red "Run analysis" in the beginning.
    #       b) Green "Up to date" when current results ~ current parameters
    #          (no action if button is clicked now).
    #       c) Yellow "Update analysis" if parameters have been changed.
    actionBttn(
      inputId = "run_analysis",
      label = "Run analysis",
      style = "material-flat",
      color = "danger"
    ),
    
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
        leaflet::leafletOutput(
          outputId = "nw_map",
          height = 600
        ),
        title = "Network map",
        width = 6,
        collapsible = TRUE
      ),
      
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
        width = 6
        
      )
      
    )
    
  )
)