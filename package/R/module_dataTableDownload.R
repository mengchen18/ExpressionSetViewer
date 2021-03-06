#' utility - dataTable for download shiny UI
#' @param id id
#' @param showTable logical, if the table should be shown
#' 
dataTableDownload_ui <- function(id, showTable = TRUE) {
  ns <- NS(id)
  if (showTable) {
    r <- tagList(
      DT::dataTableOutput(ns("table")),
      uiOutput(ns("showButton"))
    )
  } else
    r <- uiOutput(ns("showButton"))
  r
}

#' utility - dataTable for download shiny module
#' @description A subset of columns can be shown, specified by reactive_cols. 
#'   The entire table will be downloaded. 
#' @param input input
#' @param output output
#' @param session session
#' @param reactive_table table to show
#' @param reactive_cols columns to be shown
#' @param prefix file name prefix
#' @param pageLength how many row per page
#' @param sortBy sort by column (name)
#' @param decreasing logical; sort by decreasing or not
#' @importFrom utils write.table
#' @examples 
#' # source("R/module_triselector.R")
#' # library(shiny)
#' # library(stringr)
#' # 
#' # dat <- readRDS("../Dat/exampleEset.RDS")
#' # pdata <- pData(dat)
#' # 
#' # ui <- fluidPage(
#' #   dataTableDownload_ui("dtd")
#' # )
#' # server <- function(input, output, session) {
#  #   callModule(dataTableDownload_module, id = "dtd", reactive_table = reactive(pdata), reactive_cols = reactive(1:6), prefix = "testdownload")
#' # }
#' # shinyApp(ui, server)
#' 
dataTableDownload_module <- function(input, output, session, reactive_table, 
  reactive_cols=reactive(NULL), prefix = "", pageLength = 10, sortBy = NULL, decreasing = TRUE) {
  
  ns <- session$ns
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste0(prefix, Sys.time(), ".tsv")
    },
    content = function(file) {
      tab <- reactive_table()
      ic <- which(sapply(tab, is.list))
      if (length(ic) > 0) {
        for (ii in ic) {
          tab[, ii] <- sapply(tab[, ii], paste, collapse = ";")
        }
      }
      write.table(tab, file, col.names = TRUE, row.names = FALSE, quote = FALSE, sep = "\t")
    }
  )
  
  output$showButton <- renderUI({
    req(reactive_table())
    downloadButton(ns("downloadData"), "Save table")
  })
  
  formatTab <- function(tab, sel = 0, pageLength = 10) {
    dt <- DT::datatable( 
      tab,
      selection =  c("single", "multiple")[as.integer(sel)+1],
      rownames = FALSE,
      filter = "top",
      class="table-bordered compact",
      options = list(scrollX = TRUE, pageLength = pageLength, dom = 'tip')
    )
    DT::formatStyle(dt, columns = 1:ncol(tab), fontSize = '90%')
  }

  tabsort <- reactive({
    req(tab <- reactive_table())
    index <- 1:nrow(tab)
    if (!is.null(sortBy)) {
      if (sortBy %in% colnames(tab)) {
        o <- order(tab[, sortBy], decreasing = decreasing)
        tab <- tab[o, ]
        index <- index[o]
      }
    }
    if (!is.null( reactive_cols() ))
      tab <- tab[, reactive_cols()]
    ic <- which(sapply(tab, function(x) is.numeric(x) & !is.integer(x)))
    if ( length(ic) > 0 )
      tab[, ic] <- lapply(tab[, ic, drop = FALSE], signif, digits = 3)
    list(tab = tab, index = index)
  })
    

  output$table <- DT::renderDataTable({
    formatTab(tabsort()$tab, pageLength = pageLength)
    # DT::datatable(tab, options = list(scrollX = TRUE), rownames = FALSE, selection = "single")
  })
  
  reactive(tabsort()$index[input$table_rows_selected])
}
