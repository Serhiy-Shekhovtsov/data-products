
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(navbarPage("Menu",
  # Application title
  tabPanel("Exploration",
    h1("Exploring", em("cars"), "dataset with Shiny"),
    br(),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
      sidebarPanel(
        
        p("Please, select exploration options"),
        
        selectInput("column", 
                    label = "Select a column to explore",
                    choices = list("Speed (mph)" = "speed", "Stopping distance (ft)" = "dist"),
                    selected = "speed"),
        
        sliderInput("bins",
                    "Select a number of bins:",
                    min = 1,
                    max = 20,
                    value = 10)
      ),
  
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("distPlot")
      )
    )
  ),
  
  tabPanel("About",
           mainPanel(
             
             h1("Developing Data Products: Course Project"),
             p("This is a course project for", strong("Developing Data Products"), "course on ",
               HTML("<a href=\"https://www.coursera.org\">Coursera</a>."),
               "The goal is to build an interactive Shiny application"),
             
             h2("How to use the App"),
             p("On the", strong("Exploration"), "tab select the column you want to explore and number of bins for histogram plot"),
             
             h2("Source code"),
             p("The source code for this application is available ",
               a("here", 
                 href = "https://github.com/Serhiy-Shekhovtsov/data-products")),
             
             h2("Presentation"),
             p(HTML("Please, <a href=\"http://rpubs.com/Serhiy/s239182\">click here</a>, to check the presentation for this app"))
           )
  )
))
