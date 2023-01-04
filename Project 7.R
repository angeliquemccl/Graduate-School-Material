install.packages("shiny")
library(shiny)

ui <- fluidPage(
      textInput("name","Hi! What is your name?"),
      textInput("employee_number",textOutput("q"))
  
)

server <- function(input, output, session) {
  output$q <- renderText({
    paste("Dear,", input$name, "What is your employee number?")
    
  })
}

shinyApp(ui=ui, server=server)

