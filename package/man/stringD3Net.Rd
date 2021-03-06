% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auxi_queryStringdb.R
\name{stringD3Net}
\alias{stringD3Net}
\title{Drawing network given network and gene set result}
\usage{
stringD3Net(ntwk, gsa, i, label = FALSE)
}
\arguments{
\item{ntwk}{network result, often returned by "stringNetwork" function.}

\item{gsa}{gene set result, often returned by "stringGSA" function}

\item{i}{row index of gsa, which should be highlighted in the network}

\item{label}{whether the point should be labelled in the network}
}
\description{
Drawing network given network and gene set result
}
