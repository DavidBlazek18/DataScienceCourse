library(shiny)
library(ggplot2)

data <- iris

ui <- fluidPage(
  titlePanel("IrisDataSet"),
  
  sidebarLayout(position = "right"),
      sidebarPanel(h1("Iris species")),
                   img(src = "irisAll3SpeciesCombined.png", height = 140, width = 420),
                   br(),
                   br(),
                helpText("Use the following to study data from the Fischer/Anderson Iris Data Set."),
                br(),
      
      checkboxGroupInput("species", 
                  label = "Choose each species you are studying:",
                  choices = c("Setosa" = "Setosa", 
                              "Versicolor" = "Versicolor", 
                              "Virginica" = "Virginica"),
                  selected = NULL),
      
      checkboxGroupInput("data_points", 
                  label = "Data Points",
                  ggplot(data=data, colour="red"))
                 

    )
    # aes_string(x=input$variable, y=input$variable2, 
    mainPanel(
      plotOutput("selected_species"),
      plotOutput("selected_data_points")
    )
  


server <- function(input, output) {
  
  output$selected_species <- renderPlot({ 
    ("You have selected" + input$species)
  })
  
  output$selected_data_points <- renderPlot({ 
    ("You have chosen a range that goes from" + input$data_points)
  })
  
}

shinyApp(ui, server)