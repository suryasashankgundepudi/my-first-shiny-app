

# Load R packages
library(shiny)
library(ggplot2)
library(shinythemes)
options(warn=-1)



# Define UI
ui <- fluidPage(theme = shinytheme("slate"),
                navbarPage(
                  # theme = "cerulean",  # <--- To use a theme, uncomment this
                  "The Collatz Conjecture",
                  tabPanel("Interactive Visualization of the Conjecture",
                           sidebarLayout(
                             
                             sidebarPanel(
                               
                               sliderInput(inputId = "number",
                                           label = "Number of bins:",
                                           min = 1,
                                           max = 1000,
                                           value = 100) #sliderInput
                               
                             ), # sidebarPanel
                             
                             mainPanel(
                               h3("The top plot controls bottom plot. Click and make a grid to zoom"), 
                               plotOutput(outputId = "linePlot",
                                          brush = brushOpts(
                                            id = "plot2_brush",
                                            resetOnNew = TRUE
                                          )), 
                               plotOutput(outputId = "plot3")
                               
                               
                             ),
                           ),  # mainPanel, 
                           
                           
                           
                           
                  ), #  tabPanel Interactive graph
                  
                  
                  
                  tabPanel("About", 
                           titlePanel("This is my first Shiny App"),
                           sidebarLayout(
                             sidebarPanel(
                               h2("Aknowledgements"),
                               p("I was inspired to take up this project as my first
                                  shiny app after watching a video posted by veritasium 
                                 on Youtube. You can find their video ", 
                                 a("here.", 
                                   href = "https://www.youtube.com/watch?v=094y1Z2wpJg")),
                               br(),
                             
                               p("I would also like to thank the Data Professor for helping
                                 me learn the basics of Shiny for my first Shiny application.
                                 You can find the Shiny playlist", a("here", 
                                                                     href = "https://www.youtube.com/watch?v=tfN10IUX9Lo&list=PLtqF5YXg7GLkxx_GGXDI_EiAvkhY9olbe&index=2")),
                                
                               
                             ),
                             mainPanel(
                               h1("Introducing the Collatz Conjecture"),
                               p("This simple problem is something that has troubled mathematicians for a long time. 
                                 One famous Mathematician Paul Erdos quoted that", 
                                 em( "\"Mathematics is not ripe enough for a problem like this\"."),
                                ),
                               
                               withMathJax(helpText("The function goes as follows
                                        $$f(x) = 3x + 1  --- x\\%\ 2 = 1$$"),
                                           helpText("$$f(x) =  x/2 --- x\\%\ 2 =0$$")
                               ),
                               p("The conjecture states that for any natural number you take you will always reach 
                               the 4, 2, 1, loop. This is because when you get to 4, you must divide by 2
                               and then for 2 you must divide to get 1 and since 1 is odd you must multiply it
                               by three and add one to get four. Thus leaving us in a loop. To visualize this
                                 for numbers between 1-1000, I have drawn a plot that shows the movement of the
                                 function for the selected input. For example, for 7, it moves as - 22 -> 11 -> 
                                 34 -> 17 -> 52 -> 26 -> 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1 ")
                             ), 
                            
                           ))

                ) 
) # fluidPage


# Define server function  
server <- function(input, output) {
  
  
  output$linePlot <- renderPlot({
    
    
    # taking input from user for starting point of the collatz conjecture
    starting_point <- as.double(input$number)
    
    # function to create a vector of the numbers forming during the conjecture
    collatz_conjecture <- function(var = starting_point){
      
      #copying the input into a placeholder vairable
      x <- as.double(var)
      #creating a vector to hold the values for the graph
      conjecture_vector <- c(x)
      while (x != 1) {       # the iteration stops when x reaches the value 1
        if(x%%2 == 0){ 
          x = x/2            # if x is even it is divided by 2
        }
        
        else{
          x = 3*x + 1        # if x is odd it is multiplied by 3 and added to 1
        }
        
        # every time the function is executed the x value is stored in this vector
        conjecture_vector <- append(conjecture_vector, x)
        
      }
      conjecture_vector
    }
    
    final_vector <- collatz_conjecture()
    
    
    steps_it_takes <- as.double(length(final_vector))
    x_axis_values <- seq(1, steps_it_takes)
    maximum <- max(final_vector)
    upper_limit <- maximum*1.1
    y_breaks <- upper_limit/10
    if (y_breaks > 19){y_breaks <- round(y_breaks, -1)}
    
    p <- ggplot(mapping = aes(x_axis_values, final_vector)) + 
      geom_line() + 
      geom_point(size = 1, color = "blue") +  
      geom_text(aes(label = final_vector), nudge_x = 0.2, nudge_y = 1, 
                size = 3, parse = TRUE)
    
    p <- p +  scale_x_continuous(name="Step Number", 
                                 limits=c(0, steps_it_takes), 
                                 breaks = seq(0, steps_it_takes, 5)) +
      
      scale_y_continuous(name="Current Value", 
                         limits=c(0, upper_limit),
                         breaks = seq(0, upper_limit, y_breaks))
    p
    
    
  }) # render plot
  ranges2 <- reactiveValues(x = NULL, y = NULL)
  
  output$plot3 <- renderPlot({
    # taking input from user for starting point of the collatz conjecture
    starting_point <- as.double(input$number)
    
    # function to create a vector of the numbers forming during the conjecture
    collatz_conjecture <- function(var = starting_point){
      
      #copying the input into a placeholder vairable
      x <- as.double(var)
      #creating a vector to hold the values for the graph
      conjecture_vector <- c(x)
      while (x != 1) {       # the iteration stops when x reaches the value 1
        if(x%%2 == 0){ 
          x = x/2            # if x is even it is divided by 2
        }
        
        else{
          x = 3*x + 1        # if x is odd it is multiplied by 3 and added to 1
        }
        
        # every time the function is executed the x value is stored in this vector
        conjecture_vector <- append(conjecture_vector, x)
        
      }
      conjecture_vector
    }
    
    final_vector <- collatz_conjecture()
    
    
    steps_it_takes <- as.double(length(final_vector))
    x_axis_values <- seq(1, steps_it_takes)
    maximum <- max(final_vector)
    upper_limit <- maximum*1.1
    y_breaks <- upper_limit/10
    if (y_breaks > 19){y_breaks <- round(y_breaks, -1)}
    
    p <- ggplot(mapping = aes(x_axis_values, final_vector)) + 
      geom_line() + 
      geom_point(size = 1, color = "blue") +  
      geom_text(aes(label = final_vector), nudge_x = 0.2, nudge_y = 1, 
                size = 5, parse = TRUE)
    
    p <- p +  scale_x_continuous(name="Step Number", 
                                 limits=c(0, steps_it_takes), 
                                 breaks = seq(0, steps_it_takes, 5)) +
      
      scale_y_continuous(name="Current Value", 
                         limits=c(0, upper_limit),
                         breaks = seq(0, upper_limit, y_breaks))
    p +      coord_cartesian(xlim = ranges2$x, ylim = ranges2$y, expand = FALSE)
  }) #renderplot
  observe({
    brush <- input$plot2_brush
    if (!is.null(brush)) {
      ranges2$x <- c(brush$xmin, brush$xmax)
      ranges2$y <- c(brush$ymin, brush$ymax)
      
    } else {
      ranges2$x <- NULL
      ranges2$y <- NULL
    }
  })
} # server


# Create Shiny object
shinyApp(ui = ui, server = server)