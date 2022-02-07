


###########################################################################

function(input, output, session) {
  shinyjs::show("main")

  dataset<-reactive({ 
    inFile <- input$uploadFile 
    if (input$select_filter == "ColRow") { 
       dat<-read_excel(inFile$datapath , range = paste(input$range_begin,  input$range_end, sep = ":") , 1)
    } else {
      dat<-read_excel(inFile$datapath , range = cell_rows( min(input$row_index): max(input$row_index)), 1)
    }
    return(dat)
  })
  
  output$excelDataTable <- renderDT(dataset(), filter = "top", options = list(pageLength = 5 ))
  
  
#  output$jobTitleOutput <- renderUI({
#    selectInput("jobTitleInput", "Job Title",
#                sort(unique(trimws(sel_glassdoor_df$job_title)) ),
#                selected = "")
#  })
  
#  output$jobLocationOutput <- renderUI({
#    selectInput("jobLocationInput", "Job Location",
#                sort(unique(trimws(sel_glassdoor_df$city)) ),
#                selected = "")
#  })

  
#  output$resumeUrlOutput <- renderUI({
#    selectInput("resumeUrlInput", "Resume URL",
#                sort(resume_url_df$name ), 
#                width="80%",
#                selected = "")
#  })
  

  
# image2 sends pre-rendered images
#  output$image1 <- renderUI({
    
#    if (is.null(input$neo4j_pics))
#      return(NULL)
    
#    if (input$neo4j_pics == "all_rels") {
#      tags$img(src= "images/AutoDesk_Relationships.png")
#    } else if (input$neo4j_pics == "company_city") {
#      tags$img(src= "images/COMPANY_OFFICE_IN.png")
#    } else if (input$neo4j_pics == "industry_companies") {
#      tags$img(src= "images/INDUSTRY_COMPANY_MATCH.jpg")
#    }
#    })
    

}
