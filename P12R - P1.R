#Question 1

library(shiny)
library(ggplot2)
head(iris)
ui<- fluidPage(
  titlePanel("Plot control"),
  sidebarLayout(
    sidebarPanel(
      h3("Some input examples"),
      selectInput(
        inputId= "select_col",
        label ="Choose a column",
        choices = names(iris)[-length(names(iris))]#exclude last column
      ),
      selectInput(
        inputId = "select_fill",
        label = "Choose a fill color",
        choices= c("white","red","blue","orange","yellow")
      ),
      textInput(
        inputId = "text",
        label = "Plot title",
        value = "Box plot of iris")
    ),
    mainPanel(
      h3("Box plot of iris"),
      plotOutput("myplot")
    )
      )
    )

server <- function(input, output, session){
  output$myplot <- renderPlot({
    ggplot(iris)+
      geom_boxplot(aes_string(y= input$select_col),
                   fill = input$select_fill)+
      ggtitle(paste0(input$text, "-", input$select_col))
  })
}

shinyApp(ui, server)


