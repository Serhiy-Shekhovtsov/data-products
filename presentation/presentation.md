Developing Data Products: Course Project
========================================================
author: Serhiy Shekhovtsov
date: December 25, 2016
autosize: true

Introduction
========================================================
<br>

This presentation is a part of course project for **Developing Data Products** course on [Coursera](https://www.coursera.org)

It's a reproducible pitch of my Shiny application ["Exploring cars dataset with Shiny"](https://serhii.shinyapps.io/developing_data_products_course_project/)

ui.R
========================================================
<br>
## This file controls appearance of the application
<br>
I have the following code to show two inputs:

```r
selectInput("column", label = "Select a column to explore", selected = "speed",
            choices = list("Speed (mph)" = "speed", "Stopping distance (ft)" = "dist")),

sliderInput("bins", "Select a number of bins:",
            min = 1, max = 20, value = 10)
```
<br>
And the code to show the plot is following:

```r
plotOutput("distPlot")
```
server.R
========================================================
<br>
## This file represents so-called business logic layer of the application
<br>
In my case it will render the plot based on options selected by user:

```r
output$distPlot <- renderPlot({
  
  # select column based on input$column from ui.R
  x <- cars[, input$column]
  # generate bins based on input$bins from ui.R
  bins <- seq(min(x), max(x), length.out = input$bins + 1)

  # draw the histogram with the specified number of bins
  hist(x, breaks = bins, col = 'darkgray', border = 'white', 
       main = paste("Histogram of cars$", input$column, sep=""),
       xlab = input$column)
})
```

Shiny App and the Source Code
========================================================

<br>

* You can try out the application [here](https://serhii.shinyapps.io/developing_data_products_course_project/)
* And the Source Code is available on [GitHub](https://github.com/Serhiy-Shekhovtsov/data-products)

<br>

## Thank you for your time!
