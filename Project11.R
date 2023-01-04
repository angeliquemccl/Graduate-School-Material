data <- as.matrix(mtcars)
head(mtcars)
heatmap(data)
heatmap(data, scale="column")


#Question 1
install.packages("MASS")
#pull that dataset animals from the package "MASS"
data("Animals", package = "MASS")
head(Animals)
#creates the matrix from the x and y data in the dataset
info <- as.matrix(Animals)
heatmap(info)
t(info)
#the heatmap shows that in the body column the higher
#the animals body weight is the closer it is to yellow
#same with their brain.


#Question 2 - nonlinear model
install.packages("tidyverse")
install.packages("caret")
library(tidyverse)
library(caret)
data("Boston", package = "MASS")
#set.seed produces the same random numbers in this case 123 random numbers
set.seed(123)
#train data uses the original data to train the machine
training.samples <- Boston$medv %>%
  createDataPartition(p = 0.9, list = FALSE)
train.data  <- Boston[training.samples, ]
#test data checks the accuracy of the model
test.data <- Boston[-training.samples, ]
#ggplot is ploting the data with the x axis= lstat and y=medv
ggplot(train.data, aes(lstat, medv) ) +
  geom_point() +
  stat_smooth()

#Question 2 - Best Model (Poly Regression!)
#a linear regression model is used to plot the data
lm(medv ~ poly(lstat, 2, raw = TRUE), data = train.data)
model <- lm(medv ~ poly(lstat, 5, raw = TRUE), data = train.data)
#predicts the value based on the input data of test.data
predictions <- model %>% predict(test.data)
data.frame(
  #RMSE shows the root mean square of how far are predictions of the values are
  #from the observed values in the model
  RMSE = RMSE(predictions, test.data$medv),
  #R2 shows how much the indepent variables describe the value of the response variables
  R2 = R2(predictions, test.data$medv)
)
ggplot(train.data, aes(lstat, medv) ) +
  geom_point() +
  stat_smooth(method = lm, formula = y ~ poly(x, 5, raw = TRUE))

#Question 3 ShinnyApp CSV File Upload
library(shiny)
ui<- fluidPage(
  sidebarLayout(
    sidebarPanel(
      #tells the user to choose a csv file
      fileInput("file",
                "Choose CSV File",
                accept = ".csv"),
      checkboxInput("header", "Header", TRUE)
    ),
    mainPanel(
      tableOutput("contents")
    )
    ))
server <- function(input, output){
  output$contents <- renderTable({
    file <- input$file1
    #shows the path to the file being selected/input
    ext<- tolls::file_ext(file$datapath)
    
    req(file)
    #reads the file
    vaildate(need(ext=="csv",
                           "Please upload a csv file"))
             read.csv(file$datapath, header = input$header)
  })
}

shinyApp(ui, server)

