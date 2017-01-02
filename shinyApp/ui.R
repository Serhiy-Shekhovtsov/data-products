
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
               a("Coursera", 
                 href = "https://www.coursera.org"), ". The goal is to build an interactive Shiny application."),
             
             h2("Source code"),
             p("The source code for this application is available ",
               a("here", 
                 href = "https://github.com"), "."),
             
             h2("Presentation"),
             p(HTML("Please, <a href=\"https://github.com\">click here</a>, to check the presentation for this app"))
           )
  )
))
