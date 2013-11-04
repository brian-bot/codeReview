require(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Select-a-reviewer 2000",
              "Code Review Match"),
  
  sidebarPanel(
    selectInput(inputId = "user",
                label = "Who am I?",
                choices = possibleReviewers),
    checkboxInput(inputId="nojohn", label="Please don't give me John!!", value=FALSE),
    br(),
    actionButton("chooseReviewer", strong("Find me a reviewer!"))
  ),
  
  mainPanel(
    h3(textOutput("message"))
  )
))
