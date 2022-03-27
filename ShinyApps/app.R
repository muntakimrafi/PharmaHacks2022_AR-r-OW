#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(reticulate)
library(DT)
library(tidyverse)

ui <- fluidPage(
  
    theme = shinytheme("cerulean"),

    navbarPage("Disease Classification from Gut Microbiome",
               tabPanel("Predict",
                        sidebarLayout(
                          sidebarPanel(width = 3, 
                                       br(),
                                       fileInput("file1", "Upload your CSV file here",
                                                 multiple = FALSE,
                                                 accept = c("csv",
                                                            "comma-separated-values",
                                                            ".csv")),
                                       actionButton("submit", "Submit"),
                                       br(), br(),
                                       downloadButton("download", "Download results")
                                       
                          ),
                          
                          mainPanel(
                            dataTableOutput("table")
                          ))
                        ),
               )
)

server <- function(input, output) {
  
    options(shiny.maxRequestSize=30*1024^2)
  
    # fruits <- reactive({
    #   req(input$file)
    #   inFile <- input$file
    #   if(is.null(inFile))
    #     return(NULL)
    # 
    #   fruits<-read_excel(paste(inFile$datapath, ".xlsx", sep=""), sheet = 1)
    # 
    # })
    source_python("https://raw.githubusercontent.com/OmartheOrganism/PharmaHacks2022/master/Pred.py")
    # source_python("Pred.py")

    data <- reactive({
      
        if (input$submit == 0) return(NULL)
        df <-  data.frame()
        inFile <- input$file1
        if (is.null(inFile)) return(NULL)
        df  <- read.csv(inFile$datapath, sep = ",", header = T)
        return(data.frame(df, options =list(pageLength = 20)))
    })
    
    preds <- reactive({
        if(!is.null(data())){
          predicts <- prediction(data())
          datatable(predicts,
                    style = "bootstrap", #Theme
                    options =list(pageLength = 20, sDom  = '<"top">lt<"bottom">ip'))
        }
      })
    
    output$table <- renderDT(preds())

    output$download <- downloadHandler(
      filename = function() {
        "Predictions.csv"
      },
      content = function(con) {
        write.csv(preds()[[2]], con)
      }
    )
}

# Run the application 
shinyApp(ui = ui, server = server)
