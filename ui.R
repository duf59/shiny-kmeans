library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("K-means clustering example"),
    
    sidebarPanel(
        selectInput('dataset','Select a dataset:',c("iris","dat1")),
        uiOutput("varselect1"),
        uiOutput("varselect2"),
        numericInput('k', 'Number of clusters', value = 3,
                    min=1, step=1),
        selectInput('kernel','Type of kernel:',c("linear","radial (RBF)"="RBF"))
    ),
    
    mainPanel(
        h2("Instructions:"),
        p("Select a dataset and variables to be used for clustering."),
        p("Indicate the desired number of clusters and the type of kernel to be used."),
        h2("Result:"),
        plotOutput('plot')
    )    
))

# to do
# - remove shinyUI which is no longer needed
# - put the inputs in reactive() and check the values there
# - make dataset reactive
# http://stackoverflow.com/questions/26460585/r-shiny-selectinput-doesnt-reflect-the-variable-selection-when-multiple-true