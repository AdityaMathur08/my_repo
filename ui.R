library(shiny)

# Define the UI for the apllication

shinyUI(pageWithSidebar(
  
  
  #Application Title
  headerPanel("Task 71: Removing Unmapped fields from the Transformations"),
  
  
  #Sidebar with a Silder input for the number of observations
  
  sidebarPanel(
    
    sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
  
  # Input: Selector for choosing dataset ----
  
  selectInput(inputId = "dataset",
              label = "Choose a Transformation:",
              choices = c("rock", "pressure", "cars")
  ),
  
  
  
  
  # Input: Numeric entry for number of obs to view ----
  numericInput(inputId = "obs",
               label = "Number of observations to view:",
               value = 10),
  
  # Input: Text for providing a caption ----
  # Note: Changes made to the caption in the textInput control
  # are updated in the output area immediately as you type
  textInput(inputId = "caption",
            label = "Caption:",
            value = "Data Summary"),
  
  
  
  
  ),
  
  mainPanel(
    
    
    # Output: Formatted text for caption ----
    h3(textOutput("caption", container = span)),
    
    
    # Output: Verbatim text for data summary ----
    verbatimTextOutput("summary"),
    
    # Output: HTML table with requested number of observations ----
    tableOutput("view"),
    
    plotOutput("distPlot")
  )
  
  
  
))