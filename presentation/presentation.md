Developing Data Products: Course Project
========================================================
author: Serhiy Shekhovtsov
date: January 02, 2017
autosize: true


This presentation is a part of course project for **Developing Data Products** course on [Coursera](https://www.coursera.org)

ui.R
========================================================
### This file controls appearance of the application
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
### This file represents so-called business logic layer of the application

Here is a code to show the plot based on selected options:

```r
output$distPlot <- renderPlot({
  
  # select column based on input$column from ui.R
  x <- cars[, input$column]
  # generate bins based on input$bins from ui.R
  bins <- seq(min(x), max(x), length.out=input$bins+1)

  # draw the histogram with specified options
  hist(x, breaks=bins, col='darkgray',
       main=paste("Histogram of cars$", input$column, sep=""),
       xlab=input$column)
})
```

Reproducible Example
========================================================

```r
  x <- cars[, "speed"]
  bins <- seq(min(x), max(x), length.out=10)
  
  hist(x, breaks=bins, xlab="speed",
       main="Histogram of cars$speed")
```

<img src="presentation-figure/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />


Shiny App and the Source Code
========================================================

<br>

* You can try out the application [here](https://serhii.shinyapps.io/developing_data_products_course_project/)
* And the Source Code is available on [GitHub](https://github.com/Serhiy-Shekhovtsov/data-products)

<br>

## Thank you for your time!
