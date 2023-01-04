library(shiny)
library(ggplot2)
head(ChickWeight)
ui<- fluidPage(
  titlePanel("Plot control"),
  sidebarLayout(
    sidebarPanel(
      h3("Some input examples"),
      selectInput(
        inputId= "col",
        label ="Choose a column",
        choices = names(ChickWeight)[-length(names(ChickWeight))]
      ),
      selectInput(
        inputId = "fill",
        label = "Choose a fill color",
        choices= c("white","red","blue","orange","yellow")
      ),
      textInput(
        inputId = "text",
        label = "Plot title",
        value = "Chick Weight Box Plot")
    ),
    mainPanel(
      h3("Chick Wight Box Plot"),
      plotOutput("myplot2")
    )
  )
)

server <- function(input, output, session){
  output$myplot2 <- renderPlot({
    ggplot(ChickWeight)+
      geom_boxplot(aes_string(y= input$col),
                   fill = input$fill)+
      ggtitle(paste0(input$text, "-", input$col))
  })
}

shinyApp(ui, server)
