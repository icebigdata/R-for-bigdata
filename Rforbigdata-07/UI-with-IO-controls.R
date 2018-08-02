
# Load shiny
library(shiny)
#options(encoding="UTF-8")
title <- p("Input and Output")
#I/O ? œ?–´ë¥? ê°–ëŠ” UI ?ƒ?„±

ui <- fluidPage(
  titlePanel (tags$h2(title)),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "number",
        label = "Choose a Number",
        min = 0,
        max = 100,
        value = 25),
      # adding the new div tag to the sidebar            
      tags$div(class="header", checked=NA,
               tags$p("Ready to take the Shiny tutorial? If so"),
               tags$a(href="shiny.rstudio.com/tutorial", "Click Here!"))
      ),
    mainPanel(
      textOutput(
        outputId = "UTF8_text"))))

# Create a server than maps input to output
server <- function(input, output) {
  output$UTF8_text <- renderText({
    paste("You chose the number:", input$number)})
}

# Create a shiny app
shinyApp(
  ui = ui,
  server = server)

