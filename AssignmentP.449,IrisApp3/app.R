library(shiny)
library(ggplot2)



ui <- fluidPage(
  titlePanel(h1("Plot of Sepal Length vs. Width")),
  
  sidebarLayout(position = "right",
  sidebarPanel(h1("Iris Species & Parts"),
  img(src = "irisAll3SpeciesCombined.png", height = 140, width = 420),
  helpText("Use the following to study measurements from the Fischer/Anderson Iris Data Set."),

  radioButtons("species", 
                     label = "Choose the species of Iris to study:",
                     choices = c("Setosa" = "Setosa", 
                                 "Versicolor" = "Versicolor", 
                                 "Virginica" = "Virginica"),
                     selected = NULL)),
  
  mainPanel(
    plotOutput("selected_species"),
  
)
)
)



server <- function(input, output) {
  

  output$selected_species <- renderPlot({ 
    data <- switch(input$species,
                   "Setosa" = iris[iris$Species == "setosa", ],
                   "Versicolor" = iris[iris$Species == "versicolor", ],
                   "Virginica" = iris[iris$Species == "virginica", ])
  
    
    
    ggplot(data=data, aes(x=Sepal.Length, y=Sepal.Width)) + geom_point()
 #  g <- g+labs(x="A", y="B")                                               How can I change the labels to make them
 #  g                                                                       different from the column headers?
 #                                                                          This was from a tutorial, but doesn't work.
   
    
  })
 

}

shinyApp(ui, server)