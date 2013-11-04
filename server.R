require(shiny)

shinyServer(function(input, output, clientData){
  
  vals <- reactiveValues(mess = "")
  observe({
    if( input$chooseReviewer > 0 ){
      
      isolate({
        if( input$user == "Batman" ){
          vals$mess <- "You're not Batman"
        } else{
          pr <- possibleReviewers[-c(1, which(possibleReviewers == input$user))]
          if( input$nojohn & input$user != "John Hill" ){
            pr <- pr[-which(pr == "John Hill")]
          }
          rev <- sample(pr, 1)
          vals$mess <- paste(sample(possibleLeadins, 1), rev)
        }
      })
      
    }
  })
  
  output$message <- renderText({
    return(vals$mess)
  })
  
})
