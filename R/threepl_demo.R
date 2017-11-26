#' @title Three-parameter logistic IRT model Shiny demo
#'
#' @description
#' This code is a demonstration of Shiny and how Shiny can be used to explore the 3PL model.
#'
#' @examples
#' threepl_demo()
#' @export
#'

threepl_demo <- function(){
  # Load the shiny package
  require("shiny")

  # Define the 3PL function
  threepl <- function(person, b, a, c) {
    x <- c + (1 - c)*(exp(a * (person - b)) /
                        (1 + exp(a * (person - b))))
    return(x)
  }

  # Define the range of abilities, difficulties,
  # discriminations, and guessing parameters allowed
  ability <- seq(-3, 3, by = .1)
  diff <- -3:3
  discr <- -2:2
  guess <- 0:10/10

  # Create a data.frame with all the combinations
  # of the values permitted above
  parameter_setup <- expand.grid(person = ability,
                                 b = diff, a = discr, c = guess)
  # Run the threepl() function and save the probabilities
  # of getting an item correct as function of these parameters
  parameter_setup$prob <- threepl(person = parameter_setup$person,
                                  b = parameter_setup$b,
                                  a = parameter_setup$a,
                                  c = parameter_setup$c)

  # Define the user-interface (ui) function
  # Will consists of three inputs
  #
  # - A slider to set item difficulty (b)
  # - A slider to set item discrimination (c)
  # - A slider to set guessing (a)
  #
  # and the plot (called threepl).
  #
  # Note: when a = 1 and c = 0, this the Rasch
  # and when c = 0, this is the 2PL
  #
  # Shiny ui's can be drawn using a grid system
  # consisting of 12 columns wide.We make use of this below
  # by using the first 4 columns to contain the widgets
  # and the remaining 8 columns to hold the plot.
  #
  shinyApp(
  ui = fluidPage(
    column(4,
           sliderInput("b", label = "Item Difficulty",
                       min = -3, max = 3, value = 0, step = 1),
           sliderInput("a", label = "Item Discrimination",
                       min = -2, max = 2, value = 1, step = 1),
           sliderInput("c", label = "Guessing",
                       min = 0, max = 1, value = 0, step = .1)),
    column(8,
           plotOutput("threepl"))
  ),
  # Below we define a server function that
  # subset our data based on the values of the sliders
  # and then plot the IRF.
  server = function(input,output){
    output$threepl <- renderPlot({
      plot.data <- subset(parameter_setup, b == input$b &
                            a == input$a &
                            c == input$c)
      plot(prob ~ person, plot.data, type = "l",
           xlab = expression(theta),
           ylab = "Pr(Y = 1)",
           ylim = c(0, 1))
    })
  }
  )
}
