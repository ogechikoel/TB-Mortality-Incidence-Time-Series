
library(shinydashboard)
library(shiny)
library(readxl)
library(tidyverse)
library(here)
library(forecast)
library(tseries)


ui <- dashboardPage(
  dashboardHeader( title = "TB Incidence Time Series"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home"),
      menuItem("Dashboard", tabName = "dashboard"),
      menuItem("Model Diagnostics", tabName = "diagnostics")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "home",
              fluidRow(
                box(width = 12, status = "success", solidHeader = TRUE,
                    title = "Overview",
                    h4("My name is Ogechi Koel. I'm a Data Scientist and 
                       Biostatistician at DataQuest Solutions."),
                    h4("I’ve been working on a time series project focused on 
                    forecasting future TB incidence using ARIMA or SARIMA models.
                    Midway through the project, I became curious about building 
                       a Shiny app that would allow users to generate forecasts 
                       with just the click of a button."),
                    br(),
                    h4("So, I built this dashboard out of curiosity. Feel free 
                       to explore it, and don't hesitate to reach out if you have
                       any recommendations for improvement or if you're working on 
                       similar projects.")
                    )
              )
              
              ),
      
      
      tabItem(tabName = "dashboard",
              fluidRow(
                column(width = 6,
                       numericInput(inputId = "predicted_months",  label = "Enter the months to predict", 
                                    min = 6, max = 120,
                                    value = 12)),
              ),
              actionButton("forecast", "Forecast", class = "btn-success"),
              
              h3("Forecasted TB Incidence In 100, 0000 populations"),
              plotOutput("forecasted_plot"),
              
              h3("The predicted values with Confidence Intervals"),
              tableOutput("table")
              ),
      
      
      
      tabItem(tabName = "diagnostics",
              h3("1. The General Trend"),
              plotOutput("trend"),
              h3("2. Decomposed Plot"),
              plotOutput("decomposed"),
              p("The seasonal plot distinctly displays repeating patterns at 
                regular intervals, which is a clear sign of seasonality."),
              h3("3. Seasonality"),
              plotOutput("seasonality"),
              p("There is a high TB incidence in march over the Years possibly 
                because march marks the transition from winter to spring in China, 
                when respiratory infections tend to spike due to colder temperatures 
                and increased indoor crowding. This could contribute to higher TB transmission."),
              #residuals
              h3("4. Normality of the residuals"),
              plotOutput("hist_residuals"),
              p("The residuals appears to be roughly normally distributed."),
              
              h3("5. Homoscedasticity Of residuals"),
              plotOutput("homo_residuals"),
              p(" residuals appear to be roughly constant around the mean 0 
                thus homoscedasticity of the residuals holds."),
              h3("6. Box_Ljung Test For Residual Autocorrelation"),
              
              verbatimTextOutput("box_ljung"),
              p("We fail to reject the null hypothesis (p=0.9997). The residuals 
              are therefore independently distributed.")
              )
    ),
    
    tags$br(), tags$br(), tags$br(), tags$br(),
    
    # footer added here
    tags$div(
      class = "footer",
      style = "text-align: center; padding: 10px 20px; background-color: #f9f9f9; position: fixed; bottom: 0; width: 100%; z-index: 1000;",
      HTML(
        paste0(
          '<p>Contact us: ',
          '<a href="mailto:dataquestsolutions2@gmail.com">dataquestsolutions2@gmail.com</a>',
          ' | ',
          '<a href="https://wa.me/254707612395?text=Hello%20I%20am%20interested%20in%20your%20services" target="_blank">',
          '<i class="fab fa-whatsapp"></i> Chat on WhatsApp</a>',
          ' | ',
          '<a href="https://is.gd/WXTtwQ" target="_blank">Visit Our Website</a>',
          ' | Powered By DataQuest Solutions</p>'
        )
      )
    )
  )
  
)

server <- function(input, output){
  data <- read_excel(here("data", "data.xlsx"))
  
  #DATA PREPROCESSING
  #CONVERTING THE DATA INTO TIME SERIES OBJECT
  
  
  #plotting the general trend
  data <- ts(data$`TB incidence（per 100,000 populations）`, 
             start =c(2012, 01), end = c(2019, 06), frequency = 12)
  
  output$trend <- renderPlot({
    plot(aggregate(data, FUN = mean), ylab = "TB Incidence",
         main = "TB incidence General Trend")
  })
  
  #plotting the decomposed time series
  output$decomposed <- renderPlot({
    decomposed <- decompose(data,  type = "additive")
    
    
    
    #plotting
    plot(decomposed)
  })
  
  
  #SEASONALITY
  output$seasonality <- renderPlot({
    ggseasonplot(data, year.labels = TRUE, main = "Seasonal Patterns in TB Incidence")+
      theme_bw()
  })
  
  
  #FITTING THE MODEL
  
  fit <- auto.arima(data, stationary = FALSE, seasonal =TRUE)
  
  
  
  #normality of the residuals 
  
  output$hist_residuals <- renderPlot({
    #a. Residuals 
    
    #Normal distributions
    
    hist(residuals(fit), col = "skyblue", main = "Histogram of the residuals")
  })
  
  #HMOSCEDASTICITY
  
  output$homo_residuals <- renderPlot({
    #Homoscedasticity (mean = 0 and variance = 1)
    plot(residuals(fit), main = "Residuals over Time")
    abline(h = 0, col = "red")
  })
  
  #AUTOCORRELATION OF RESIDUALS
  
  output$box_ljung <- renderPrint({
    Box.test(residuals(fit))
  }
    
  )
  
  
  observeEvent(input$forecast, {
  
  #FORECASTING 
  forecasted <- forecast(fit, level = c(95), h = input$predicted_months) 
  forecasted
  #plotting
  
  output$forecasted_plot <- renderPlot({
    plot(forecasted, main = "Forecasted values")
    
  })
  
  #the forecasted values 
  
  output$table <- renderTable({
    
    forecasted
  })
  
  })
  
  
  
}

shinyApp(ui, server)

