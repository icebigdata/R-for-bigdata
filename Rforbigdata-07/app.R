
library(shiny)

ui <- fluidPage(
  titlePanel("����Ÿ��Ʋ"),
  
  sidebarLayout(
    sidebarPanel(h2("�޴�"),
                 br(),
                 fluidRow(
                   column(6,
                          h4("����"),
                          actionButton("per", label = "����")),
                   column(6, 
                          h4("����"),
                          helpText("����ڿ��� ������ �����ϴ� ���"))),
                 br(),
                 fluidRow(
                   column(6, 
                          h4("����"),
                          submitButton("����")),
                   column(6,
                          numericInput("number",
                                       label = h4("�����Է�"),
                                       value = 10))),
                 h4("Single CheckBox"),
                 checkboxInput("checkbox", label = "���� 1", value = TRUE),
                 checkboxGroupInput("checkGroup",
                                    label = h4("CheckBox Group"),
                                    choices = list ("����1" = 1, "����2" = 2, "����3" = 3),
                                    selected = 2),
                 dateInput("date",
                           label = h4("��¥�Է�"),
                           value = "2017-08-15"),
                 dateRangeInput("date", label = h4("�Ⱓ����")),
                 fileInput("file", label = h4("����÷��"))),
    
    
    
    mainPanel(h1("����1"),
              br(),
              br(),
              img(src = "Heroes1.jpg", height = 150, width = 200),
              p(a("wOBA", href = "http://www.fangraphs.com/library/offense/woba/"),"�� Ÿ���� �ƽ��� �κ��� �������ִ�", strong("�����ǥ"), "�� 'Ÿ���� �������ġ'�� ���Ѵ�."),
              br(),
              h2("�м�")
    )))

#ShinyApp


server <- function(input, output) {}         # server.R



# Run the application 
shinyApp(ui = ui, server = server)
