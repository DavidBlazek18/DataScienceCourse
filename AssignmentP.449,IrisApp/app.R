library(shiny)
library(tidyverse)
dataset <- iris
# Define UI ----
ui <- fluidPage(
  titlePanel("Iris Data"),
  
  sidebarLayout(position = "right",
    sidebarPanel(h1("Iris species"),
                 img(src = "irisAll3SpeciesCombined.png", height = 140, width = 420),
                  br(),
                 br(),
                 checkboxGroupInput("species", 
                                    h4("Check all species to be studied:"), 
                                    choices = list("Setosa" = 1, 
                                                   "Versicolor" = 2, 
                                                   "Virginica" = 3),
                                    selected = NULL),
                 checkboxGroupInput("sepal_and_petal", 
                                     h4("Check all Sepal and Petal dimensions to be studied:"), 
                                     choices = list("Sepal Length" = 1, 
                                                    "Sepal Width" = 2, 
                                                    "Petal Length" = 3,
                                                    "Petal Width" = 4),
                                     selected = NULL)),
                
    
    
    mainPanel(
      plotOutput("selected_species"),
      plotOutput("selected_sepal_and_petal")
      )
    )
)


# Define server logic ----

server <- function(input, output) {
  
  output$selected_species <- renderPlot({ 
    plot("You have selected", input$species[1], input$species[2], input$species[1] )
  })
  
  output$selected_sepal_and_petal <- renderPlot({ 
    paste("You have chosen a range that goes from",
          input$sepal_and_petal[1], input$sepal_and_petal[2], input$sepal_and_petal[3], input$sepal_and_petal[4])
  })
  
}


# Run the app ----
shinyApp(ui = ui, server = server)
