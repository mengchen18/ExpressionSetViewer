% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/module_string.R
\name{string_module}
\alias{string_module}
\title{Utility string module}
\usage{
string_module(input, output, session, reactive_ids)
}
\arguments{
\item{input}{input}

\item{output}{output}

\item{session}{session}

\item{reactive_ids}{ids passed to stringDB}
}
\description{
Utility string module
}
\examples{
#' # # # ####################
# library(shiny)
# library(shinycssloaders)
# source("Git/R/auxi_queryStringdb.R")
# dat <- readRDS("Dat/exampleEset.RDS")
# fd <- Biobase::fData(dat)
# 
# ui <- fluidPage(
#   string_ui("str")
# )
# 
# server <- function(input, output, session) {
#   callModule(string_module, id = "str", reactive_ids = reactive(ids))
# }
# 
# shinyApp(ui, server)

}
