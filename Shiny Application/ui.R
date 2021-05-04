library(shiny)

shinyUI(
  navbarPage("My Shiny App",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The relationship between variables and MPG"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Gross horsepower" = "hp",
                                          "Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 mile time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("Title")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("Description of the Data Set",
                      
                      h3("Regression Models Course Project (from Coursera)"),
                      helpText("You are given a dataset of collection of cars and you are tesked to explore the relationship",
                               "between a set of variables and MPG (outcome). You want to find out whether an automatic or manual transmission vehicle is better for MPG. Also find difference in MPG of automatic and manual transmissions"),
                      h3("Crucial"),
                      p("11 variables within a data frame with 32 observations."),
                      
                      a("https://class.coursera.org/regmods-008")
             ),
             tabPanel("Further Data Detail",
                      h2("Motor Trend Car Road Tests"),
                      hr(),
                      h3("Description"),
                      helpText("These data was obtained from the 1974 Motor Trend US magazine,",
                               " and contains fuel consumption and 10 views of automobile design and performance",
                               " for 32 vehicles (1973-74 models)."),
                      h3("Format"),
                      p("11 variables within a data frame with 32 observation."),
                      
                      p("  [, 1]   mpg         Miles/(US) gallon"),
                      p("  [, 2]	 cyl	 Number of cylinders"),
                      p("  [, 3]	 disp	 Displacement (cu.in.)"),
                      p("  [, 4]	 hp	 Gross horsepower"),
                      p("  [, 5]	 drat	 Rear axle ratio"),
                      p("  [, 6]	 wt	 Weight (lb/1000)"),
                      p("  [, 7]	 qsec	 1/4 mile time"),
                      p("  [, 8]	 vs	 V/S"),
                      p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                      p("  [,10]	 gear	 Number of forward gears"),
                      p("  [,11]	 carb	 Number of carburetors"),
                      
                      h3("Source"),
                      
                      p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.")
             )
            
             )
  )
