# My first Shiny application.

This is my first shiny application. I started out learning R programming at the beginning of this year and wanted to deploy
data science projects or financial analysis tools as a web application. Recently, I came across the Shiny package in R and
wanted to start working with and deploy a basic and interactive line plot. Hence I plotted the movement of the Collatz 
Conjucture for various inputs from the user. The graph also allows the user to zoom in and see the values at various parts 
of the graph. 

# Collatz Conjecture 
This simple problem is something that has troubled mathematicians for a long time.  One famous Mathematician Paul Erdos quoted that 
*Mathematics is not ripe enough for a problem like this*. 

The function goes as follows 
    $$f(x) = 3x + 1  --- x\\%\ 2 = 1$$
    $$f(x) =  x/2 --- x\\%\ 2 =0$$
The conjecture states that for any natural number you take you will always reach 
the 4, 2, 1, loop. This is because when you get to 4, you must divide by 2
and then for 2 you must divide to get 1 and since 1 is odd you must multiply it
by three and add one to get four. Thus leaving us in a loop. To visualize this
for numbers between 1-1000, I have drawn a plot that shows the movement of the
function for the selected input.
                             ), 
                            
