% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/module_ora.R
\name{enrichment_analysis_module}
\alias{enrichment_analysis_module}
\title{Utility enrichment analysis shiny module}
\usage{
enrichment_analysis_module(input, output, session, reactive_pathway_mat,
  reactive_i, reactive_featureData)
}
\arguments{
\item{input}{input}

\item{output}{output}

\item{session}{session}

\item{reactive_pathway_mat}{reactive value of a (binary) gene set matrix}

\item{reactive_i}{reactive index of rows to be selected (for ORA)}

\item{reactive_featureData}{reactive feature data}
}
\description{
Utility enrichment analysis shiny module
}
\examples{
#' # source("Git/R/auxi_fgsea.R")
# source("Git/R/auxi_vectORA.R")
# source("Git/R/module_barplotGsea.R")

# dat <- readRDS("Dat/exampleEset.RDS")
# fd <- fData(dat)
# fdgs <- fd[, grep("^GS\\\\|", colnames(fd))]
# selected_ids <- which(fd$`PCA|All|PC1(9.1\%)` > 0.02 )

# ui <- fluidPage(
#   enrichment_analysis_ui("ea")
# )

# server <- function(input, output, session) {
#   callModule(enrichment_analysis_module, id = "ea",
#              reactive_pathway_mat = reactive(fdgs), reactive_i = reactive(selected_ids)
#   )
# }

# shinyApp(ui, server)
}
