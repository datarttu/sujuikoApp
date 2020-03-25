library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(leaflet)

source('R/ui.R')
source('R/server.R')

shinyApp(ui = ui, server = server)
