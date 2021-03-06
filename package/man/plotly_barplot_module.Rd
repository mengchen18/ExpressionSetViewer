% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/module_barplotGsea.R
\name{plotly_barplot_module}
\alias{plotly_barplot_module}
\title{utility - barplot shiny module}
\usage{
plotly_barplot_module(input, output, session, ...)
}
\arguments{
\item{input}{input}

\item{output}{output}

\item{session}{session}

\item{...}{other parameters passed to plotly_barplot function, except source}
}
\description{
utility - barplot shiny module
}
\examples{
1
# library(shiny)
# dat <- readRDS("Dat/exampleEset.RDS")
# fd <- fData(dat)
# 
# # # examples
# ui <- fluidPage(
#   plotly_barplot_ui("tx")
# )
# server <- function(input, output, session) {
#   set.seed(100)
#   # n <- 100
#   s_x <- fd$`t-test|OV_BR|md`
#   s_n <- rownames(fd)
#   v <- callModule(plotly_barplot_module, id = "tx",
#              x = s_x, names = s_n, highlight <- c(5, 6, 9, 10, NA) , sort = "inc")
#   observe(print(v()))
# }
# shinyApp(ui, server)

}
