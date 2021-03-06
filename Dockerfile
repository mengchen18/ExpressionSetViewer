# Docker inheritance
FROM mengchen18/expression_set_viewer:V0_1_13

# Install required Bioconductor package
RUN apt install -y libgit2-dev
RUN R -e 'install.packages("devtools")'
RUN R -e 'devtools::install_github("mengchen18/ExpressionSetViewer/package", dependencies = FALSE)'

COPY shinyApp/ui.R /srv/shiny-server/sample-apps/ExpressionSetViewer/
COPY shinyApp/server.R /srv/shiny-server/sample-apps/ExpressionSetViewer/
