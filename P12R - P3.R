#install.packages("maps")
#install.packages("leaflet")
library(maps)
library(leaflet)
library(dplyr)
library(shiny)
library(tidyverse)

data("world.cities")
world.cities
ui <- fluidPage(
  titlePanel("My first shiny app"),
  leafletOutput("mymap"),
  fluidRow(column(2, 
                  sliderInput("slider1", h3("Select the population"),
                              min = 0, max = 1000000, value = 100000),
                  # here the slider allows to keep a max, min and a set value to start the app with
                  radioButtons("radio", h3("Select the country"),
                               choices = list("Poland" = "Poland", "Norway" = "Norway",
                                              "Belgium"="Belgium", "USA"= "USA", "Jordan"="Jordan"), selected = "United States")
  )
  )
)


server <- function(input, output, session) {
  
  output$mymap <- renderLeaflet({
    
    leaflet(world.cities %>%
              dplyr::filter(
                country.etc == input$radio,
                pop > input$slider1
              )) %>%
      addTiles() %>%
      addMarkers(lat = ~lat, lng=~long)
    
    
  })
  
  
}

shinyApp(ui, server)
