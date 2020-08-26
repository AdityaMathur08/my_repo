library(shiny)
library(readxl)
#Define the Server Logic required to generate and plot a random distribution


shinyServer(function(input,output){
  
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  
  output$distPlot <- renderPlot({
    
    # generate an rnorm distribution and plot it
    dist <- rnorm(input$bins)
    hist(dist)
  })
  
  
  
  # Return the requested dataset ----
  datasetInput <- reactive({
    read_excel(paste("./Data/",input$dataset,".XLSX",sep = ""))
  })
  
  
  # Generate a summary of the dataset ----
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  
  # Show the first "n" observations ----
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
  
  # Create caption ----
  # The output$caption is computed based on a reactive expression
  # that returns input$caption. When the user changes the
  # "caption" field:
  #
  # 1. This function is automatically called to recompute the output
  # 2. New caption is pushed back to the browser for re-display
  #
  # Note that because the data-oriented reactive expressions
  # below don't depend on input$caption, those expressions are
  # NOT called when input$caption changes
  output$caption <- renderText({
    input$caption
  })
  
  
  
  
  
  
  
  
  
})