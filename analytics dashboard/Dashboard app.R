## ============================================================================
## ADVANCED DATA SCIENCE DASHBOARD - PROFESSIONAL VERSION
## ============================================================================
## Enhanced with: Error Handling, Professional UI, Interactive Tables,
## Download Options, and Premium Visualizations
## ============================================================================

## If you don't have the libraries, uncomment and install
#install.packages("arules")
#install.packages("ggplot2")
#install.packages("dplyr")
#install.packages("scales")
#install.packages("plotly")
#install.packages("shiny")
#install.packages("shinythemes")
#install.packages("DT")
#install.packages("arulesViz")
#install.packages("shinyWidgets")
#install.packages("shinycssloaders")

library(shiny)          # Library for creating interactive web applications
library(shinythemes)    # Library to apply themes to Shiny interfaces
library(DT)             # Library for creating interactive tables
library(ggplot2)        # Library for creating visualizations
library(dplyr)          # Library for data manipulation
library(stringr)        # Library for handling text and strings
library(arules)         # Library for generating association rules
library(arulesViz)      # Library for visualizing association rules
library(plotly)         # Library for creating interactive visualizations
library(shinyWidgets)   # Library for enhanced UI widgets
library(shinycssloaders) # Library for loading spinners

# ============================================================================
# PROFESSIONAL COLOR PALETTE
# ============================================================================
colors_palette <- list(
  primary = "#667eea",      # Purple-Blue gradient start
  secondary = "#764ba2",    # Purple gradient end
  accent = "#f093fb",       # Pink accent
  success = "#4facfe",      # Blue success
  warning = "#f5af19",      # Orange warning
  danger = "#eb3349",       # Red danger
  dark = "#1a1a2e",         # Dark background
  light = "#eef2f7",        # Light background
  card_bg = "rgba(255,255,255,0.1)",  # Card background
  text = "#ffffff"          # Text color
)

# Professional chart colors
chart_colors <- c("#667eea", "#764ba2", "#f093fb", "#4facfe", "#00f2fe", 
                  "#43e97b", "#38f9d7", "#fa709a", "#fee140", "#f5af19")

# ============================================================================
# CUSTOM CSS FOR PROFESSIONAL UI
# ============================================================================
custom_css <- "
/* ========== GLOBAL STYLES ========== */
body {
  background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
  min-height: 100vh;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* ========== HEADER STYLES ========== */
.main-header {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  padding: 25px 30px;
  border-radius: 15px;
  margin-bottom: 25px;
  box-shadow: 0 10px 40px rgba(102, 126, 234, 0.4);
  text-align: center;
}

.main-header h1 {
  color: white;
  font-size: 2.2em;
  font-weight: 700;
  margin: 0;
  text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
  letter-spacing: 1px;
}

.main-header p {
  color: rgba(255,255,255,0.9);
  margin: 8px 0 0 0;
  font-size: 1.1em;
}

/* ========== GLASSMORPHISM CARDS ========== */
.glass-card {
  background: rgba(255, 255, 255, 0.08);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.15);
  border-radius: 20px;
  padding: 25px;
  margin-bottom: 20px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.glass-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 15px 45px rgba(102, 126, 234, 0.3);
}

/* ========== SIDEBAR STYLES ========== */
.well {
  background: rgba(255, 255, 255, 0.08) !important;
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.15) !important;
  border-radius: 20px !important;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3) !important;
}

/* ========== SECTION HEADERS ========== */
.section-header {
  color: white;
  font-size: 1.2em;
  font-weight: 600;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 2px solid rgba(102, 126, 234, 0.5);
  display: flex;
  align-items: center;
}

.section-header i {
  margin-right: 10px;
  color: #667eea;
}

/* ========== BUTTON STYLES ========== */
.btn-primary, .action-button {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
  border: none !important;
  border-radius: 12px !important;
  padding: 12px 25px !important;
  font-weight: 600 !important;
  text-transform: uppercase !important;
  letter-spacing: 1px !important;
  box-shadow: 0 5px 20px rgba(102, 126, 234, 0.4) !important;
  transition: all 0.3s ease !important;
  width: 100%;
  margin-top: 15px;
}

.btn-primary:hover, .action-button:hover {
  transform: translateY(-2px) !important;
  box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6) !important;
}

.btn-success {
  background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%) !important;
  border: none !important;
  border-radius: 10px !important;
  box-shadow: 0 5px 20px rgba(67, 233, 123, 0.3) !important;
}

/* ========== TAB STYLES ========== */
.nav-tabs {
  border-bottom: 2px solid rgba(102, 126, 234, 0.3) !important;
  margin-bottom: 25px;
}

.nav-tabs > li > a {
  color: rgba(255,255,255,0.7) !important;
  background: transparent !important;
  border: none !important;
  border-radius: 10px 10px 0 0 !important;
  padding: 15px 25px !important;
  font-weight: 500 !important;
  transition: all 0.3s ease !important;
}

.nav-tabs > li > a:hover {
  color: white !important;
  background: rgba(102, 126, 234, 0.2) !important;
}

.nav-tabs > li.active > a {
  color: white !important;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
  border: none !important;
}

/* ========== TABLE STYLES ========== */
.dataTables_wrapper {
  color: white !important;
}

table.dataTable {
  background: rgba(255, 255, 255, 0.05) !important;
  border-radius: 15px !important;
  overflow: hidden;
}

table.dataTable thead th {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
  color: white !important;
  border: none !important;
  padding: 15px !important;
  font-weight: 600 !important;
}

table.dataTable tbody td {
  color: white !important;
  border-color: rgba(255,255,255,0.1) !important;
  padding: 12px !important;
}

table.dataTable tbody tr:hover {
  background: rgba(102, 126, 234, 0.2) !important;
}

/* ========== INPUT STYLES ========== */
.form-control, .shiny-input-container input {
  background: rgba(255, 255, 255, 0.1) !important;
  border: 1px solid rgba(255, 255, 255, 0.2) !important;
  border-radius: 10px !important;
  color: white !important;
  padding: 12px 15px !important;
}

.form-control:focus {
  border-color: #667eea !important;
  box-shadow: 0 0 15px rgba(102, 126, 234, 0.3) !important;
}

/* Slider styling */
.irs--shiny .irs-bar {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
}

.irs--shiny .irs-handle {
  background: #667eea !important;
  border: 3px solid white !important;
}

/* ========== STAT CARDS ========== */
.stat-card {
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.3) 0%, rgba(118, 75, 162, 0.3) 100%);
  border-radius: 15px;
  padding: 20px;
  text-align: center;
  border: 1px solid rgba(255,255,255,0.1);
  margin-bottom: 15px;
}

.stat-card h3 {
  color: #667eea;
  font-size: 2em;
  margin: 0;
  font-weight: 700;
}

.stat-card p {
  color: rgba(255,255,255,0.8);
  margin: 5px 0 0 0;
  font-size: 0.9em;
}

/* ========== PLOT CONTAINERS ========== */
.plot-container {
  background: rgba(255, 255, 255, 0.05);
  border-radius: 15px;
  padding: 20px;
  margin-bottom: 20px;
  border: 1px solid rgba(255,255,255,0.1);
}

.plot-title {
  color: white;
  font-size: 1.1em;
  font-weight: 600;
  margin-bottom: 15px;
  text-align: center;
}

/* ========== DOWNLOAD BUTTONS ========== */
.download-btn {
  background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%) !important;
  color: white !important;
  border: none !important;
  border-radius: 10px !important;
  padding: 10px 20px !important;
  font-weight: 600 !important;
  margin: 5px !important;
  transition: all 0.3s ease !important;
}

.download-btn:hover {
  transform: translateY(-2px) !important;
  box-shadow: 0 5px 20px rgba(67, 233, 123, 0.4) !important;
}

/* ========== LABELS ========== */
label {
  color: rgba(255,255,255,0.9) !important;
  font-weight: 500 !important;
  margin-bottom: 8px !important;
}

/* ========== FILE INPUT ========== */
.btn-file {
  background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%) !important;
  border: none !important;
  border-radius: 10px !important;
}

/* ========== ANIMATIONS ========== */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.fade-in {
  animation: fadeInUp 0.5s ease-out;
}

/* ========== SCROLLBAR ========== */
::-webkit-scrollbar {
  width: 8px;
}

::-webkit-scrollbar-track {
  background: rgba(255,255,255,0.1);
  border-radius: 10px;
}

::-webkit-scrollbar-thumb {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  border-radius: 10px;
}

/* ========== NOTIFICATION STYLES ========== */
.shiny-notification {
  background: rgba(30, 30, 50, 0.95) !important;
  border: 1px solid rgba(102, 126, 234, 0.5) !important;
  border-radius: 15px !important;
  color: white !important;
}
"

# ============================================================================
# USER INTERFACE (UI)
# ============================================================================
ui <- fluidPage(
  
  # Apply custom theme and CSS
  theme = shinytheme("darkly"),
  tags$head(
    tags$style(HTML(custom_css)),
    tags$link(rel = "stylesheet", 
              href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css")
  ),
  
  # Main container with padding
  div(style = "padding: 20px;",
      
      # ===== HEADER =====
      div(class = "main-header fade-in",
          h1(HTML('<i class="fas fa-chart-line"></i> Advanced Data Science Dashboard')),
          p("Powered by Machine Learning & Association Rules Mining")
      ),
      
      # ===== MAIN LAYOUT =====
      sidebarLayout(
        
        # ===== SIDEBAR =====
        sidebarPanel(
          width = 3,
          
          # File Upload Section
          div(class = "section-header",
              HTML('<i class="fas fa-upload"></i> Data Upload')
          ),
          fileInput("file", NULL, 
                    accept = ".csv",
                    buttonLabel = "Browse...",
                    placeholder = "Select CSV file"),
          
          hr(style = "border-color: rgba(255,255,255,0.1);"),
          
          # Analysis Parameters Section
          div(class = "section-header",
              HTML('<i class="fas fa-sliders-h"></i> Analysis Parameters')
          ),
          
          # Cluster settings
          sliderInput("clusters", 
                      HTML('<i class="fas fa-project-diagram"></i> Number of Clusters:'),
                      min = 2, max = 10, value = 3, step = 1),
          
          # Association Rules settings
          numericInput("min_support", 
                       HTML('<i class="fas fa-percentage"></i> Minimum Support:'),
                       value = 0.01, min = 0.001, max = 1, step = 0.01),
          
          numericInput("min_confidence", 
                       HTML('<i class="fas fa-check-circle"></i> Minimum Confidence:'),
                       value = 0.1, min = 0.001, max = 1, step = 0.01),
          
          hr(style = "border-color: rgba(255,255,255,0.1);"),
          
          # Action Button
          actionButton("clean", 
                       HTML('<i class="fas fa-play"></i> Analyze Data'),
                       class = "btn-primary"),
          
          hr(style = "border-color: rgba(255,255,255,0.1);"),
          
          # Download Section
          div(class = "section-header",
              HTML('<i class="fas fa-download"></i> Export Results')
          ),
          downloadButton("download_clusters", 
                         HTML('<i class="fas fa-table"></i> Download Clusters'),
                         class = "download-btn"),
          br(), br(),
          downloadButton("download_rules", 
                         HTML('<i class="fas fa-list"></i> Download Rules'),
                         class = "download-btn")
        ),
        
        # ===== MAIN PANEL =====
        mainPanel(
          width = 9,
          
          tabsetPanel(
            id = "main_tabs",
            type = "tabs",
            
            # ----- TAB 1: Data Preview -----
            tabPanel(
              title = HTML('<i class="fas fa-database"></i> Data Preview'),
              value = "data_tab",
              div(class = "glass-card fade-in", style = "margin-top: 20px;",
                  
                  # Statistics Row
                  fluidRow(
                    column(3, div(class = "stat-card",
                                  h3(textOutput("stat_rows", inline = TRUE)),
                                  p("Total Rows"))),
                    column(3, div(class = "stat-card",
                                  h3(textOutput("stat_cols", inline = TRUE)),
                                  p("Total Columns"))),
                    column(3, div(class = "stat-card",
                                  h3(textOutput("stat_customers", inline = TRUE)),
                                  p("Unique Customers"))),
                    column(3, div(class = "stat-card",
                                  h3(textOutput("stat_cities", inline = TRUE)),
                                  p("Cities")))
                  ),
                  
                  hr(style = "border-color: rgba(255,255,255,0.1);"),
                  
                  # Data Table
                  withSpinner(DTOutput("data_preview"), 
                              type = 6, color = "#667eea")
              )
            ),
            
            # ----- TAB 2: K-Means Clustering -----
            tabPanel(
              title = HTML('<i class="fas fa-project-diagram"></i> K-Means Clusters'),
              value = "kmeans_tab",
              div(class = "glass-card fade-in", style = "margin-top: 20px;",
                  
                  # Cluster Visualization
                  div(class = "plot-container",
                      div(class = "plot-title", "Interactive Cluster Visualization"),
                      withSpinner(plotlyOutput("kmeans_plot", height = "450px"),
                                  type = 6, color = "#667eea")
                  ),
                  
                  hr(style = "border-color: rgba(255,255,255,0.1);"),
                  
                  # Cluster Data Table
                  div(class = "plot-title", "Clustered Data"),
                  withSpinner(DTOutput("kmeans_table"),
                              type = 6, color = "#667eea")
              )
            ),
            
            # ----- TAB 3: Association Rules -----
            tabPanel(
              title = HTML('<i class="fas fa-link"></i> Association Rules'),
              value = "rules_tab",
              div(class = "glass-card fade-in", style = "margin-top: 20px;",
                  
                  # Rules Statistics
                  fluidRow(
                    column(4, div(class = "stat-card",
                                  h3(textOutput("rules_count", inline = TRUE)),
                                  p("Total Rules Generated"))),
                    column(4, div(class = "stat-card",
                                  h3(textOutput("max_support", inline = TRUE)),
                                  p("Max Support"))),
                    column(4, div(class = "stat-card",
                                  h3(textOutput("max_confidence", inline = TRUE)),
                                  p("Max Confidence")))
                  ),
                  
                  hr(style = "border-color: rgba(255,255,255,0.1);"),
                  
                  # Rules Table
                  div(class = "plot-title", "Association Rules (Interactive Table)"),
                  withSpinner(DTOutput("rules_table"),
                              type = 6, color = "#667eea")
              )
            ),
            
            # ----- TAB 4: Visualizations -----
            tabPanel(
              title = HTML('<i class="fas fa-chart-pie"></i> Visualizations'),
              value = "viz_tab",
              div(class = "glass-card fade-in", style = "margin-top: 20px;",
                  
                  fluidRow(
                    column(6, 
                           div(class = "plot-container",
                               div(class = "plot-title", 
                                   HTML('<i class="fas fa-credit-card"></i> Payment Type Distribution')),
                               withSpinner(plotlyOutput("p1", height = "350px"),
                                           type = 6, color = "#667eea")
                           )),
                    column(6, 
                           div(class = "plot-container",
                               div(class = "plot-title", 
                                   HTML('<i class="fas fa-users"></i> Age vs Total Spending')),
                               withSpinner(plotlyOutput("p2", height = "350px"),
                                           type = 6, color = "#667eea")
                           ))
                  ),
                  
                  fluidRow(
                    column(6, 
                           div(class = "plot-container",
                               div(class = "plot-title", 
                                   HTML('<i class="fas fa-city"></i> Total Spending by City')),
                               withSpinner(plotlyOutput("p3", height = "350px"),
                                           type = 6, color = "#667eea")
                           )),
                    column(6, 
                           div(class = "plot-container",
                               div(class = "plot-title", 
                                   HTML('<i class="fas fa-chart-bar"></i> Spending Distribution')),
                               withSpinner(plotlyOutput("p4", height = "350px"),
                                           type = 6, color = "#667eea")
                           ))
                  )
              )
            )
          ) # End tabsetPanel
        ) # End mainPanel
      ) # End sidebarLayout
  ) # End main container
)

# ============================================================================
# SERVER LOGIC
# ============================================================================
server <- function(input, output, session) {
  
  # ==========================================================================
  # REACTIVE VALUES for storing processed data
  # ==========================================================================
  rv <- reactiveValues(
    raw_data = NULL,
    cleaned_data = NULL,
    kmeans_result = NULL,
    rules = NULL,
    rules_df = NULL
  )
  
  # ==========================================================================
  # DATA LOADING with Error Handling
  # ==========================================================================
  observeEvent(input$file, {
    tryCatch({
      df <- read.csv(input$file$datapath)
      
      # Validate required columns
      required_cols <- c("items", "count", "total", "age", "city", "paymentType")
      missing_cols <- setdiff(required_cols, names(df))
      
      if (length(missing_cols) > 0) {
        showNotification(
          paste("Missing columns:", paste(missing_cols, collapse = ", ")),
          type = "error",
          duration = 5
        )
        return()
      }
      
      rv$raw_data <- df
      showNotification("Data loaded successfully!", type = "message", duration = 3)
      
    }, error = function(e) {
      showNotification(paste("Error loading file:", e$message), type = "error", duration = 5)
    })
  })
  
  # ==========================================================================
  # DATA CLEANING with Error Handling
  # ==========================================================================
  observeEvent(input$clean, {
    req(rv$raw_data)
    
    tryCatch({
      withProgress(message = 'Processing data...', value = 0, {
        
        df <- rv$raw_data
        incProgress(0.2, detail = "Removing duplicates...")
        
        # Clean data
        df <- df %>%
          distinct() %>%
          na.omit() %>%
          filter_if(is.numeric, all_vars(. >= 0))
        
        incProgress(0.2, detail = "Removing outliers...")
        
        # Remove outliers (FIXED: now saving result to df)
        outliers <- boxplot.stats(df$count)$out
        df <- df[!df$count %in% outliers, ]
        
        # Trim whitespace from items
        df$items <- str_trim(df$items)
        
        rv$cleaned_data <- df
        incProgress(0.2, detail = "Applying K-Means clustering...")
        
        # Apply K-Means Clustering
        df_numeric <- df %>% select_if(is.numeric)
        if (ncol(df_numeric) >= 2) {
          df_pca <- as.data.frame(prcomp(df_numeric, scale. = TRUE)$x[, 1:2])
          rv$kmeans_result <- kmeans(df_pca, centers = input$clusters, nstart = 25)
        }
        
        incProgress(0.2, detail = "Mining association rules...")
        
        # Generate Association Rules
        items_list <- strsplit(as.character(df$items), ",")
        transactions <- as(items_list, "transactions")
        
        rules <- apriori(transactions, 
                         parameter = list(support = input$min_support, 
                                          confidence = input$min_confidence,
                                          minlen = 2),
                         control = list(verbose = FALSE))
        
        if (length(rules) > 0) {
          rv$rules <- rules
          # Convert rules to data frame for display
          rules_df <- as(rules, "data.frame")
          rules_df <- rules_df %>%
            mutate(
              support = round(support, 4),
              confidence = round(confidence, 4),
              coverage = round(coverage, 4),
              lift = round(lift, 2),
              count = count
            ) %>%
            arrange(desc(confidence))
          rv$rules_df <- rules_df
        } else {
          rv$rules <- NULL
          rv$rules_df <- NULL
          showNotification("No rules found. Try lowering support/confidence.", 
                           type = "warning", duration = 5)
        }
        
        incProgress(0.2, detail = "Complete!")
      })
      
      showNotification("Analysis completed successfully!", type = "message", duration = 3)
      
    }, error = function(e) {
      showNotification(paste("Error during analysis:", e$message), 
                       type = "error", duration = 5)
    })
  })
  
  # ==========================================================================
  # DATA PREVIEW TAB OUTPUTS
  # ==========================================================================
  
  # Statistics
  output$stat_rows <- renderText({
    req(rv$cleaned_data)
    format(nrow(rv$cleaned_data), big.mark = ",")
  })
  
  output$stat_cols <- renderText({
    req(rv$cleaned_data)
    ncol(rv$cleaned_data)
  })
  
  output$stat_customers <- renderText({
    req(rv$cleaned_data)
    length(unique(rv$cleaned_data$customer))
  })
  
  output$stat_cities <- renderText({
    req(rv$cleaned_data)
    length(unique(rv$cleaned_data$city))
  })
  
  # Data Preview Table
  output$data_preview <- renderDT({
    req(rv$cleaned_data)
    datatable(
      head(rv$cleaned_data, 500),
      options = list(
        pageLength = 10,
        scrollX = TRUE,
        dom = 'Bfrtip',
        initComplete = JS(
          "function(settings, json) {",
          "$(this.api().table().header()).css({'background-color': '#667eea', 'color': '#fff'});",
          "}")
      ),
      class = 'cell-border stripe',
      rownames = FALSE
    )
  })
  
  # ==========================================================================
  # K-MEANS TAB OUTPUTS
  # ==========================================================================
  
  # K-Means Interactive Plot
  output$kmeans_plot <- renderPlotly({
    req(rv$cleaned_data, rv$kmeans_result)
    
    df <- rv$cleaned_data %>% select_if(is.numeric)
    df_pca <- as.data.frame(prcomp(df, scale. = TRUE)$x[, 1:2])
    df_pca$Cluster <- as.factor(rv$kmeans_result$cluster)
    
    p <- ggplot(df_pca, aes(x = PC1, y = PC2, color = Cluster, text = paste("Cluster:", Cluster))) +
      geom_point(size = 3, alpha = 0.7) +
      scale_color_manual(values = chart_colors[1:input$clusters]) +
      labs(title = "", x = "Principal Component 1", y = "Principal Component 2") +
      theme_minimal() +
      theme(
        plot.background = element_rect(fill = "transparent", color = NA),
        panel.background = element_rect(fill = "transparent", color = NA),
        panel.grid.major = element_line(color = "rgba(255,255,255,0.1)"),
        panel.grid.minor = element_line(color = "rgba(255,255,255,0.05)"),
        axis.text = element_text(color = "white"),
        axis.title = element_text(color = "white"),
        legend.background = element_rect(fill = "transparent"),
        legend.text = element_text(color = "white"),
        legend.title = element_text(color = "white")
      )
    
    ggplotly(p, tooltip = "text") %>%
      layout(
        paper_bgcolor = 'rgba(0,0,0,0)',
        plot_bgcolor = 'rgba(0,0,0,0)',
        font = list(color = 'white'),
        legend = list(font = list(color = 'white'))
      )
  })
  
  # K-Means Table
  output$kmeans_table <- renderDT({
    req(rv$cleaned_data, rv$kmeans_result)
    
    cluster_data <- rv$cleaned_data
    cluster_data$Cluster <- rv$kmeans_result$cluster
    
    datatable(
      cluster_data,
      options = list(
        pageLength = 10,
        scrollX = TRUE,
        dom = 'Bfrtip'
      ),
      class = 'cell-border stripe',
      rownames = FALSE
    )
  })
  
  # ==========================================================================
  # ASSOCIATION RULES TAB OUTPUTS
  # ==========================================================================
  
  output$rules_count <- renderText({
    if (is.null(rv$rules_df)) return("0")
    format(nrow(rv$rules_df), big.mark = ",")
  })
  
  output$max_support <- renderText({
    if (is.null(rv$rules_df)) return("N/A")
    paste0(round(max(rv$rules_df$support) * 100, 2), "%")
  })
  
  output$max_confidence <- renderText({
    if (is.null(rv$rules_df)) return("N/A")
    paste0(round(max(rv$rules_df$confidence) * 100, 2), "%")
  })
  
  output$rules_table <- renderDT({
    req(rv$rules_df)
    
    datatable(
      rv$rules_df,
      options = list(
        pageLength = 15,
        scrollX = TRUE,
        order = list(list(2, 'desc')),  # Sort by confidence
        dom = 'Bfrtip'
      ),
      class = 'cell-border stripe',
      rownames = FALSE
    ) %>%
      formatPercentage(c('support', 'confidence', 'coverage'), 2) %>%
      formatRound('lift', 2)
  })
  
  # ==========================================================================
  # VISUALIZATIONS TAB OUTPUTS
  # ==========================================================================
  
  # Payment Type Distribution (Pie Chart)
  output$p1 <- renderPlotly({
    req(rv$cleaned_data)
    
    payment_data <- rv$cleaned_data %>%
      group_by(paymentType) %>%
      summarise(count = n()) %>%
      mutate(percentage = count/sum(count)*100)
    
    plot_ly(payment_data, 
            labels = ~paymentType, 
            values = ~count,
            type = 'pie',
            marker = list(colors = chart_colors[1:nrow(payment_data)],
                          line = list(color = '#FFFFFF', width = 2)),
            textinfo = 'label+percent',
            textfont = list(color = 'white', size = 14),
            hoverinfo = 'label+value+percent') %>%
      layout(
        showlegend = TRUE,
        paper_bgcolor = 'rgba(0,0,0,0)',
        plot_bgcolor = 'rgba(0,0,0,0)',
        font = list(color = 'white'),
        legend = list(font = list(color = 'white'))
      )
  })
  
  # Age vs Total Spending (Bar Chart)
  output$p2 <- renderPlotly({
    req(rv$cleaned_data)
    
    age_data <- rv$cleaned_data %>%
      group_by(age) %>%
      summarise(total_spending = sum(total, na.rm = TRUE)) %>%
      arrange(age)
    
    plot_ly(age_data,
            x = ~factor(age),
            y = ~total_spending,
            type = 'bar',
            marker = list(
              color = ~total_spending,
              colorscale = list(c(0, '#667eea'), c(1, '#764ba2')),
              line = list(color = 'white', width = 1)
            ),
            hovertemplate = 'Age: %{x}<br>Spending: $%{y:,.0f}<extra></extra>') %>%
      layout(
        xaxis = list(title = 'Age', color = 'white'),
        yaxis = list(title = 'Total Spending', color = 'white'),
        paper_bgcolor = 'rgba(0,0,0,0)',
        plot_bgcolor = 'rgba(0,0,0,0)',
        font = list(color = 'white')
      )
  })
  
  # Total Spending by City (Bar Chart)
  output$p3 <- renderPlotly({
    req(rv$cleaned_data)
    
    city_data <- rv$cleaned_data %>%
      group_by(city) %>%
      summarise(total_spending = sum(total, na.rm = TRUE)) %>%
      arrange(desc(total_spending))
    
    plot_ly(city_data,
            x = ~reorder(city, -total_spending),
            y = ~total_spending,
            type = 'bar',
            marker = list(
              color = chart_colors[1:nrow(city_data)],
              line = list(color = 'white', width = 1)
            ),
            hovertemplate = 'City: %{x}<br>Spending: $%{y:,.0f}<extra></extra>') %>%
      layout(
        xaxis = list(title = 'City', color = 'white', tickangle = 45),
        yaxis = list(title = 'Total Spending', color = 'white'),
        paper_bgcolor = 'rgba(0,0,0,0)',
        plot_bgcolor = 'rgba(0,0,0,0)',
        font = list(color = 'white')
      )
  })
  
  # Spending Distribution (Histogram)
  output$p4 <- renderPlotly({
    req(rv$cleaned_data)
    
    plot_ly(rv$cleaned_data,
            x = ~total,
            type = 'histogram',
            marker = list(
              color = '#667eea',
              line = list(color = '#764ba2', width = 1)
            ),
            hovertemplate = 'Range: %{x}<br>Count: %{y}<extra></extra>') %>%
      layout(
        xaxis = list(title = 'Total Spending', color = 'white'),
        yaxis = list(title = 'Frequency', color = 'white'),
        paper_bgcolor = 'rgba(0,0,0,0)',
        plot_bgcolor = 'rgba(0,0,0,0)',
        font = list(color = 'white'),
        bargap = 0.1
      )
  })
  
  # ==========================================================================
  # DOWNLOAD HANDLERS
  # ==========================================================================
  
  # Download Clustered Data
  output$download_clusters <- downloadHandler(
    filename = function() {
      paste("clustered_data_", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      req(rv$cleaned_data, rv$kmeans_result)
      cluster_data <- rv$cleaned_data
      cluster_data$Cluster <- rv$kmeans_result$cluster
      write.csv(cluster_data, file, row.names = FALSE)
    }
  )
  
  # Download Association Rules
  output$download_rules <- downloadHandler(
    filename = function() {
      paste("association_rules_", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      req(rv$rules_df)
      write.csv(rv$rules_df, file, row.names = FALSE)
    }
  )
}

# ============================================================================
# RUN THE APPLICATION
# ============================================================================
shinyApp(ui = ui, server = server)