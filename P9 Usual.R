tabItems(
  tabItem(tabName = "dname",
          "District:"),
  tabItem(tabName = "ethb",
          "The data for Algebra 1 Black students!"),
  tabItem(tabName = "females",
          "The data for Algebra 1 female students!")
  
  menuItem("Black Students",
           tabName= "ethb"),
  menuItem("Females",
           tabName = "females")
  ______________________________________________________________________________________
  
  #install.packages("shinydashboard")
  library("shinydashboard")
  
  head(tea)
  sidebar <- dashboardSidebar(
    sidebarMenu(
      menuItem("BEAUMONT ISD",
               tabName = "bisd"),
      selectInput(
        inputId = "bisd",
        label = "Select Algebra 1 Data",
        choices = c("Black Student Data", "Female Data", "Ecominically Disadvantaged Students Data")
      )
    ),
    sidebarMenu(
      menuItem("HOUSTON ISD",
               tabName = "hisd"),
      selectInput(
        inputId = "hisd",
        label = "Select Algebra 1 Data",
        choices = c("Black Student Data", "Female Data", "Ecominically Disadvantaged Students Data")
      )
    ),
    sidebarMenu(
      menuItem("DALLAS ISD",
               tabName = "disd"),
      selectInput(
        inputId = "disd",
        label = "Select Algebra 1 Data",
        choices = c("Black Student Data", "Female Data", "Ecominically Disadvantaged Students Data")
      )
    )
  )
  body <- dashboardBody(
    textOutput("dname")
  )
  
  ui <- dashboardPage(header = dashboardHeader(),
                      sidebar = sidebar,
                      body = body
  )
  
  #filepath <- "Documents\tea.dat"
  
  #server <- function(input, output, session) {
  #  tea_data <- reactiveFileReader(
  #    intervalMillis = 1000,
  #    session = session, 
  #    filePath = filepath,
  #    read_dta = read_dta
  #  )
  #}
  shinyApp(ui, server)
  ___________________________________________________________________________________________
  
  ui <- dashboardPage(header, sidebar, body)
  
  server <-function(input,output, session){
    output$table <-renderTable({
      tea(input$datvar)})
    output$plot <- renderPlot({
      a <- paste0("year",input$graphvar)
      plot(as.formula(a),
           data=tea,
           main=a,
           outline=input$outliers)
    })
  }
  ______________________________________________________________________________________________________
  
  sexf <- sum(tea$a1_sexf_d, na.rm = TRUE)
  
  body <- dashboardBody(
    fluidRow(
      valueBox(
        value = sexf,
        subtitle = " Female TEA Scores in Texas",
  