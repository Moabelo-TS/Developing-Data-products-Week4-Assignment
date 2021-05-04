library(shiny)
library(datasets)

MilesPerGalon_Data <- mtcars
MilesPerGalon_Data$am <- factor(MilesPerGalon_Data$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("mpg ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=MilesPerGalon_Data)
  })
  
  output$Title <- renderText({
    formulaText()
  })
  
  output$mpgBoxPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data =MilesPerGalon_Data ,
            outline = input$outliers)
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$mpgPlot <- renderPlot({
    with(MilesPerGalon_Data, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })
  
})