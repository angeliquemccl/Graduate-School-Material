#install.packages("shinydashboard")
library("shinydashboard")

head(tea)
ui<- fluidPage(
  titlePanel("Texas Test Scores"),
  textInput("District",
            "Enter a district name:", "Beaumont ISD"),
  textOutput("d"),
  sidebarLayout(
    sidebarUserPanel(
      sliderInput('range', 'Test Score Range', 0, 200, 15)),
    mainPanel(
      tabsetPanel(
        tabPanel('Female',
                 plotOutput('female_hist')),
        tabPanel('Black',
                 plotOutput('hist_black')),
        tabPanel('Male',
                 plotOutput('hist_male'))
      )
    )
  )
)
server <- function(input, output, session){
  output$d <- renderText({
    paste("This is the district you have chosen,",
          input$District)
  })
  output$female_hist <- renderPlot({
    hist(tea$a1_sexf_d,
         breaks = input$range,
         col = 'steelblue')
  })
  output$hist_black <- renderPlot({
    hist(tea$a1_ecoy_d,
         breaks = input$range,
         col = 'blue')
  })
  output$hist_male <- renderPlot({
    hist(tea$a1_sexm_d,
         breaks = input$range,
         col = 'steelblue')
  })
}
shinyApp(ui = ui, server = server)
