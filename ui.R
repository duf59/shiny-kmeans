library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("K-means clustering examples"),
    
    sidebarPanel(
        selectInput('dataset','Select a dataset:',c("iris","dat1")),
        uiOutput("varselect1"),
        uiOutput("varselect2"),
        numericInput('k', 'Number of clusters', value = 3,
                    min=1, step=1),
        selectInput('kernel','Type of kernel:',c("linear","RBF"))
    ),
    
    mainPanel(
        plotOutput('plot')
    )    
))

# to do
# - remove shinyUI which is no longer needed
# - put the inputs in reactive() and check the values there
# - make dataset reactive
# http://stackoverflow.com/questions/26460585/r-shiny-selectinput-doesnt-reflect-the-variable-selection-when-multiple-true