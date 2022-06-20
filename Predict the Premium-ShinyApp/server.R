library(caret)
library(randomForest)
function(input, output, session) {
  
  get_0_or_1 <- function(value,number){
    if (number %in% value){
      return(1)
    }else{
      return(0)
    }
  }
  get_yes_or_no <- function(value,number){
    if (1 == value){
      return("Yes")
    }else{
      return("No")
    }
  }
  covert_date_to_age<-function(value){
    if(!is.null(value) ) {
    days <- as.integer((Sys.Date() - as.Date(value)))
    years <- as.integer(days / 365)
    months <- as.integer((days %% 365 ) / 30)
    age <- paste(years, 'year(s)', months, 'month(s)')                                          
    return(years)
    }else{
      return (21)
    }
  }
  convert_sur_to_number <- function(value){
    if ("1"==value){
      return(1)
    }else if ("2"==value){
      return (2)
    }else if ("3 and above"==value){
      return (3)
    }else{
      return(0)
    }
  }
  get_prediction<-function(df){
    return (round(predict(rf, newdata=df),1))
  }

  
  
  termx <- reactive({
    # Change when the "update" button is pressed...
    input$update
    # ...but not for anything else
    Age <- covert_date_to_age(input$age)
    Weight <- input$wei
    AnyTransplants <- get_0_or_1(input$d,3)
    NumberOfMajorSurgeries <-convert_sur_to_number(input$sur)
    AnyChronicDiseases <-get_0_or_1(input$d,4)
    Height <-input$hei
    HistoryOfCancerInFamily<-get_0_or_1(input$d,6)
    BloodPressureProblems<-get_0_or_1(input$d,2)
    Diabetes<-get_0_or_1(input$d,1)
    KnownAllergies<-get_0_or_1(input$d,5)
    #print(paste(Age,Weight,HistoryOfCancerInFamily))

    infe_df <- data.frame(
      Age,
      Weight,
      AnyTransplants,
      NumberOfMajorSurgeries,
      AnyChronicDiseases,
      Height,
      HistoryOfCancerInFamily,
      BloodPressureProblems,
      Diabetes,
      KnownAllergies
    )
    result<-predict(rf, newdata=infe_df)
    personal_str <- paste("Your Age : ",(Age),"<br/>Your Weight : ",(Weight),"<br/>Your Height : ",(Height))
    medical_str <- paste("Diabetes : ",get_yes_or_no(Diabetes),"<br/>Blood Pressure : ",get_yes_or_no(BloodPressureProblems),"<br/>Any Transplants : ",get_yes_or_no(AnyTransplants)
                         ,"<br/>Chronic Diseases : ",get_yes_or_no(AnyChronicDiseases),"<br/>Known Allergies : ",get_yes_or_no(KnownAllergies),"<br/>History of Cancer in Family : ",get_yes_or_no(HistoryOfCancerInFamily),
                         "<br/>Major Surgery Involved : ",NumberOfMajorSurgeries)
    out <- list("personal" = personal_str, "medical" = medical_str, "result" = result)
    return (out)
  })
  
  # Define a reactive expression for the document term matrix
  terms <- reactive({
    # Change when the "update" button is pressed...
    input$update
    # ...but not for anything else
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getTermMatrix(input$selection)
      })
    })
  })
  

  
#  output$d1 <- renderPrint({
#    cat("Personal Information")
#  })
  
  
  output$per <- renderUI ({
    v <- termx()
    HTML((v[[1]]))
  })
  
#  output$d2 <- renderPrint({
#    cat("Medical Conditions")
#  })
  
  
  output$med <- renderUI({
    v <- termx()
    HTML(v[[2]])
  })
  output$red <- renderPrint({
    v <- termx()
    cat("Predicted Annual Medical Premium : ")
    cat(round(v[[3]],2))
  })
  output$mon <- renderPrint({
    v <- termx()
    cat("Predicted Monthly Medical Premium : ")
    cat(round(v[[3]]/12,2))
  })
}