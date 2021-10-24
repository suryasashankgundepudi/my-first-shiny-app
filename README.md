# My first Shiny application.

[](https://i2.wp.com/opencurve.info/wp-content/uploads/2020/04/featured-image-collatz-harriss-e1588439815159.jpeg)

You can find the application live [HERE](https://gv9wj.shinyapps.io/The_Collatz_Conjecture/). In case it isn't live please mail me at gundepudi18047@mech.ssn.edu.in

This is my first shiny application. I started out learning R programming at the beginning of this year and wanted to deploy
data science projects or financial analysis tools as a web application. Recently, I came across the Shiny package in R and
wanted to start working with and deploy a basic and interactive line plot. Hence I plotted the movement of the Collatz 
Conjucture for various inputs from the user. The graph also allows the user to zoom in and see the values at various parts 
of the graph. 

# Collatz Conjecture 
This simple problem is something that has troubled mathematicians for a long time.  One famous Mathematician Paul Erdos quoted that 
*Mathematics is not ripe enough for a problem like this*. 

The function goes as follows 
```math
     f(x) = 3x + 1  if x% 2 = 1
    
     f(x) =  x/2 if x% 2 =0
```

The conjecture states that for any natural number you take you will always reach 
the 4, 2, 1, loop. This is because when you get to 4, you must divide by 2
and then for 2 you must divide to get 1 and since 1 is odd you must multiply it
by three and add one to get four. Thus leaving us in a loop. To visualize this
for numbers between 1-1000, I have drawn a plot that shows the movement of the
function for the selected input.

# Aknowledgements 
I was inspired to take up this project as my first shiny app after watching a video posted by veritasium 
on Youtube. You can find their video [here](https://www.youtube.com/watch?v=094y1Z2wpJg) 

I would also like to thank the Data Professor for helping me learn the basics of Shiny for my first Shiny application. I have followed most of this course
to implement the code written here. 
You can find the Shiny playlist [here](https://www.youtube.com/watch?v=tfN10IUX9Lo&list=PLtqF5YXg7GLkxx_GGXDI_EiAvkhY9olbe&index=2)

For learning about the zoom function please visit this [link](https://shiny.rstudio.com/gallery/plot-interaction-zoom.html)
