# code below gets called once when running app

library(shiny)
library(ggplot2)
library(kernlab)

shinyServer(
    function(input,output,session) {
        
        # code below runs once for every new user (or page refresh)
        
        
        # code below run repeatedly as needed when new values are entered
    
        output$varselect1 <- renderUI({
            selectInput("var1", label="Select first variable for clustering:",
                        choices=names(dataset()), selected=names(dataset())[1])  
        })
        output$varselect2 <- renderUI({
            selectInput("var2", label="Select first variable for clustering:",
                        choices=names(dataset()), selected=names(dataset())[2])  
        })
        
        dataset <- reactive({
            if (input$dataset=="iris") {
                data(iris)
                iris[,-5]
            } else if (input$dataset=="dat1") {
                read.table("data/self_test.data", skip=1, col.names = c("x","y")) 
            } else data.frame()
        })
        
        compute <- reactive({
                    
            data   <- subset(dataset(), select=c(input$var1,input$var2))
            colnames(data) <- c("x","y")
                    
            if(input$k>nrow(unique(data))) updateNumericInput(session,"k", value = nrow(unique(data)))
            if(input$k<1)                  updateNumericInput(session,"k", value = 1)
            
            if (input$kernel=="linear") {
                Kclust <- kmeans(data ,input$k)
                list(kmean.result = data.frame(data, cluster=as.factor(Kclust$cluster)),
                     centers = as.data.frame(Kclust$centers))
            } else if (input$kernel=="RBF") {
                Kclust <- kkmeans(as.matrix(data), input$k, kernel="rbfdot")
                list(kmean.result = data.frame(data, cluster=as.factor(Kclust@.Data)),
                    centers = data.frame(x=Kclust@centers[,1],
                                         y=Kclust@centers[,2]))
            }
        })
        
        output$plot <- renderPlot({
            data=compute()
            ggplot(data=data$kmean.result, aes(x=x, y=y, color=cluster)) +
                geom_point(size=3) + geom_point(data=data$centers,
                                                aes(x=x, y=y, color='Center'), pch=17, size=7) +
                ggtitle("Clustering result") + xlab(input$var1) + ylab(input$var2)
        })
    }    
)