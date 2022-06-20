fluidPage(
  # Application title
  #titlePanel("Predict the Premium"),
  h1(id="big-heading", strong("Predict the Premium")),
  tags$style(HTML("#big-heading{color: red;}")),
  
    setBackgroundImage(
      src = "https://abcbaa304fd84ba6ac549c515a26365d.app.rstudio.cloud/file_show?path=%2Fcloud%2Fproject%2Fback1.jpg"
    ),
  
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      dateInput("age", "Enter your Birthdate",
                startview="year",
                value=Sys.Date(),
                     helpText("Please select date")),

      sliderInput("hei", "Your Height (CM)",
                  min = 80, max = 200, value = 21
      ),
      sliderInput("wei", "Your Weight (KG)",
                  min = 20, max = 120, value = 50
      ),
      hr(),
      checkboxGroupInput(
        "d","title",
        c("Diabetes"=1,
          "Blood Pressure"=2,
          "Any Transplants"=3,
          "Chronic Diseases"=4,
          "Known Allergies"=5,
          "History of Cancer in Family"=6)
      ),
      selectInput("sur", "Major Surgery Involved",
                  choices = c("0","1","2","3 and above")),
      actionButton("update", "Start Predict Annual Premium"),
      
      #submitButton("Click to Refresh"),
      hr()
    ),

    
    # Show Word Cloud
    mainPanel(
      h1(strong("Personal Information"), style = "font-size:40px;color:blue"),
      span(uiOutput("per"), style="color:blue;font-size:20px"),
      hr(),
      h1(strong("Medical Conditions"), style = "font-size:40px;color:blue"),
      span(uiOutput("med"), style="color:blue;font-size:20px"),
      
      hr(),
      h1(strong("Prediction"), style = "font-size:40px;color:blue"),
      span(textOutput("red"), style="color:blue;font-size:20px"),
      span(textOutput("mon"), style="color:blue;font-size:20px"),
      
      hr(),
      
    )
  )
)