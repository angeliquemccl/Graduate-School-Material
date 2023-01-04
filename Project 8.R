library(shiny)
head(mtcars)
ui <- pageWithSidebar(
 headerPanel("Miles Per Gallon"),
 sidebarPanel(
   selectInput("variable", "Variable:",
               c("Cylinders" = "cyl",
                 "Weight" = "wt",
                 "Displacement"= "disp")),
   
   #outliers are data values that are away from other values
   checkboxInput("outliers", "Show outliers", TRUE)
   
 ),
 mainPanel(
   
   #Formatted text for caption
   h3(textOutput("caption")),
   
   plotOutput("mpgPlot")
 )
)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manuel"))


server <- function(input, output){
 
   formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
   output$caption <- renderText({
     formulaText()
   })
   
   output$mpgPlot <- renderPlot({
     boxplot(as.formula(formulaText()),
             data =mpgData,
             outline = input$outliers,
             col = "#7511DB", pch =19)
   })
}

shinyApp(ui=ui, server=server)
