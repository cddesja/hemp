#' @title Diagnostic plot for factor analysis Shiny demo
#'
#' @description
#' This code is a demonstration of Shiny and how Shiny can be used to explore violations to the factor analytic model.
#'
#' @examples
#' fadiag_demo()
#' @export
#'
fadiag_demo <- function(){
  # Load the required R packages
  library("shiny")
  library("lavaan")

  # Shiny ui's can be drawn using a grid system
  # consisting of 12 columns wide. We make use of this below
  # by using the first 4 columns to contain the inputs (widgets)
  # and the remaining 8 columns to hold the plot.
  shinyApp(
    ui = fluidPage(
      column(4,
             # This creates the input for setting our factor loading
             # for manifest variable one. The default value is set to
             # 0.5 and if we click the arrows, it will increase/decrease
             # by 0.5
             numericInput("lam",
                          "Value for the factor loading for manifest variable 1.",
                          value = .5,
                          step = .5),

             # This creates the checkbox for a non-linear
             # quadratic relationship. When the box is unchecked,
             # the relationship is linear.
             checkboxInput("nonlinear",
                           "Should manifest variable 1 have a non-linear
                       relationship with the factor?",
                           value = F)
      ),
      column(8,
             # This will draw our diagnostic plot
             plotOutput("diagPlot")
      )
    ),

    # Below we define a server function
    # Every time we refresh the input random
    # data will be created. So, no two plots will
    # be identical!

    server = function(input, output) {
      output$diagPlot <- renderPlot({

        # Create our factor as a standard random normal variable.
        # rnorm() ensures every time the plots are different.
        f1 <- rnorm(500)

        # If we specify the non-linear relationship
        # then f1 will be squared else it won't be.
        # We also add some specific variance/uniqueness
        # (the rnorm part at the end).
        if(input$nonlinear) {
          m1 <- input$lam * f1 + 2 * f1^2 + rnorm(500)
        } else {
          m1 <- input$lam * f1 + rnorm(500)
        }

        # Now do the same thing for manifest variables 2 - 4,
        # expect their relationship with the factor is always
        # fixed.
        # The .60, .75, and .9 are the factor loadings
        # The rnorm() adds specific/unique variance
        m2 <- .60 * f1 + rnorm(500)
        m3 <- .75 * f1 + rnorm(500)
        m4 <- .9 * f1 + rnorm(500)
        dat <- data.frame(m1, m2, m3, m4)

        # Define the CFA model, run it, and extract the factor scores
        mod <- '
    fact =~ m1 + m2 + m3 + m4
    '
        fit <- cfa(mod, dat, std.lv = T)
        dat$pred <- predict(fit)[,1]

        # Create a 2 by 2 plot (the par stuff) and
        # add a blue LOWESS curve to each of the manifest
        # variables against the est. factor scores sub plots.
        par(mfrow = c(2,2))
        for(i in 1:4){
          plot(dat[,i] ~ pred, dat, xlab = "Est. Factor Score",
               ylab = paste("Manifest Var", i))
          lines(lowess(dat$pred, dat[,i]), col = "blue")
        }
      })
    }
  )
}
