library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(leaflet)
library(RPostgreSQL)
library(pool)
library(sf)

source('R/ui.R')
source('R/server.R')

shinyApp(ui = ui, server = server)
