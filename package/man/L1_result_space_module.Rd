% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/L1_module_result_space.R
\name{L1_result_space_module}
\alias{L1_result_space_module}
\title{Utility L1 result space ui}
\usage{
L1_result_space_module(input, output, session, reactive_expr,
  reactive_phenoData, reactive_featureData, reactive_i = reactive(NULL),
  reactive_highlight = reactive(NULL), additionalTabs = NULL,
  object = NULL)
}
\arguments{
\item{input}{input}

\item{output}{output}

\item{session}{session}

\item{reactive_expr}{expression matrix}

\item{reactive_phenoData}{phentype data}

\item{reactive_featureData}{feature data}

\item{reactive_i}{row ID/name of rows selected}

\item{reactive_highlight}{col ID/name of columns selected}

\item{additionalTabs}{additional tabs added to "Analyst" panel}

\item{object}{originally loaded object, mostly an ExpressionSet object}
}
\description{
Utility L1 result space ui
}
