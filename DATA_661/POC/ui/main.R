hidden(
  fluidRow(
  id = "main",

  column(
    12,
    div(
      dashboardPage(
        dashboardHeader(title = "POC"),
        dashboardSidebar(
         
          sidebarMenu(
            menuItem("Dashboard", tabName = "dashboard", icon=icon("line-chart"), selected=TRUE),
            menuItem("Source Code",  icon = icon("file-text-o"),
                     menuSubItem("global.R", tabName = "global", icon = icon("angle-right")),
                     menuSubItem("ui.R", tabName = "ui", icon = icon("angle-right")),
                     menuSubItem("server.R", tabName = "server", icon = icon("angle-right")),
                     menuSubItem("main.R", tabName = "mainUI", icon = icon("angle-right"))
            ),
            menuItem("About", tabName = "about", icon = icon("question"))
          )
        ),
        dashboardBody(
          tabItems(
            tabItem("dashboard",
                    
                    ############
                    fluidRow(
                      column(width = 4,
                             fileInput("uploadFile", "Choose XLSX file")
                      ),
                      column(width = 2,
                             textInput(inputId = "range_begin", label="Column_Row Begin", value="A2")
                      ),column(width = 2,
                             textInput(inputId = "range_end", label="Column_Row End", value="G100")
                      ),
                      column(width = 4,
                             radioButtons("select_filter","Filter", c("Filter by Column-Row" = "ColRow", "Filter by row index" = "RowIndex"), inline=T),
                             sliderInput("row_index", "Row Slider",
                                         min = 1, max = 100, value = c(1, 50))
                      )
                    ),
                    
                   
                    # Show a plot of the generated distribution
                    tabsetPanel(
                      tabPanel(title = "Sheet1 data",
                               DTOutput('excelDataTable')  
                    ))
            ),
            
            #############################################################
            tabItem(tabName = "global",
                    box(width = NULL, status = "primary", solidHeader = TRUE, title= "global.R",
                        downloadButton('downloadData1', 'Download'),
                        br(),br(),
                        pre(includeText("global.R"))
                        
                    )
            ),
            tabItem(tabName = "ui",
                    box( width = NULL, status = "primary", solidHeader = TRUE, title="ui.R",
                         downloadButton('downloadData2', 'Download'),
                         br(),br(),
                         pre(includeText("ui.R"))
                    )
            ),
            tabItem(tabName = "server",
                    box( width = NULL, status = "primary", solidHeader = TRUE, title="server.R",
                         downloadButton('downloadData3', 'Download'),
                         br(),br(),
                         pre(includeText("server.R"))
                    )
            ),
            tabItem(tabName = "mainUI",
                    box( width = NULL, status = "primary", solidHeader = TRUE, title="main.R",
                         downloadButton('downloadData4', 'Download'),
                         br(),br(),
                         pre(includeText("ui/main.R"))
                    )
            ),
          
            
            tabItem(tabName = "about",
                    fluidPage(
                      tags$iframe(src = "Final_Project_R3.html",
                                  width = '100%', height = '800px', 
                                 frameborder = 0, scrolling = 'auto'
                       )
                    )
            )
            ########################################
          )
        )
      )
    )
  )
))
