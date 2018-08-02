
library(shiny)

ui <- fluidPage(
  titlePanel("메인타이틀"),
  
  sidebarLayout(
    sidebarPanel(h2("메뉴"),
                 br(),
                 fluidRow(
                   column(6,
                          h4("실행"),
                          actionButton("per", label = "실행")),
                   column(6, 
                          h4("도움말"),
                          helpText("사용자에게 도움을 제공하는 기능"))),
                 br(),
                 fluidRow(
                   column(6, 
                          h4("제출"),
                          submitButton("제출")),
                   column(6,
                          numericInput("number",
                                       label = h4("숫자입력"),
                                       value = 10))),
                 h4("Single CheckBox"),
                 checkboxInput("checkbox", label = "선택 1", value = TRUE),
                 checkboxGroupInput("checkGroup",
                                    label = h4("CheckBox Group"),
                                    choices = list ("선택1" = 1, "선택2" = 2, "선택3" = 3),
                                    selected = 2),
                 dateInput("date",
                           label = h4("날짜입력"),
                           value = "2017-08-15"),
                 dateRangeInput("date", label = h4("기간산정")),
                 fileInput("file", label = h4("파일첨부"))),
    
    
    
    mainPanel(h1("제목1"),
              br(),
              br(),
              img(src = "Heroes1.jpg", height = 150, width = 200),
              p(a("wOBA", href = "http://www.fangraphs.com/library/offense/woba/"),"는 타율의 아쉬운 부분을 보완해주는", strong("통계지표"), "로 '타석당 득점기대치'를 말한다."),
              br(),
              h2("분석")
    )))

#ShinyApp


server <- function(input, output) {}         # server.R



# Run the application 
shinyApp(ui = ui, server = server)

