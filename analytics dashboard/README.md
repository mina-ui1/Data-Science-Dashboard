# 🚀 Retail Analytics Dashboard

<div align="center">

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![Shiny](https://img.shields.io/badge/Shiny-shinyapps-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**An interactive Data Science Dashboard for retail transaction analysis**

[Features](#-features) • [Installation](#-installation) • [Usage](#-usage) • [Screenshots](#-screenshots) • [Technologies](#-technologies)

</div>

---

## 📋 Overview

A comprehensive **R Shiny Dashboard** that performs end-to-end data analysis on retail transaction data. The application includes automated data cleaning, customer segmentation using K-Means clustering, product association mining using the Apriori algorithm, and interactive visualizations.

## ✨ Features

### 🧹 Data Cleaning Pipeline
- Remove duplicate records
- Handle missing values
- Filter negative numeric values
- Detect and remove outliers using IQR method
- Standardize text data

### 🤖 Machine Learning & Data Mining
- **K-Means Clustering**: Customer segmentation with PCA dimensionality reduction
- **Association Rules**: Apriori algorithm for market basket analysis
- Configurable parameters (support, confidence, cluster count)

### 📊 Interactive Visualizations
- Payment Type Distribution (Pie Chart)
- Age vs Total Spending (Bar Chart)
- Spending by City (Bar Chart)
- Transaction Distribution (Histogram)
- Cluster Visualization (Scatter Plot)

### 💎 Professional UI
- Modern glassmorphism design
- Dark theme with gradient colors
- Responsive layout
- Loading spinners
- Real-time notifications

## 📁 Dataset Structure

| Column | Description | Type |
|--------|-------------|------|
| `items` | Products purchased (comma-separated) | Text |
| `count` | Number of items in transaction | Numeric |
| `total` | Total transaction value | Numeric |
| `customer` | Customer name | Text |
| `age` | Customer age | Numeric |
| `city` | Customer city | Text |
| `paymentType` | Payment method (Cash/Credit) | Text |

## 🛠 Installation

### Prerequisites
- R (version 4.0 or higher)
- RStudio (recommended)

### Install Required Packages

```r
install.packages(c(
  "shiny",
  "shinythemes",
  "shinyWidgets",
  "shinycssloaders",
  "DT",
  "ggplot2",
  "plotly",
  "dplyr",
  "stringr",
  "arules",
  "arulesViz"
))
```

## 🚀 Usage

1. Clone or download this repository
2. Open `FINAL FINAL PROJECT.R` in RStudio
3. Click **Run App** or execute:

```r
shiny::runApp("FINAL FINAL PROJECT.R")
```

4. Upload your CSV file with the required columns
5. Adjust parameters (clusters, support, confidence)
6. Click **Analyze Data** to process

## 📸 Screenshots

### Dashboard Tabs

| Tab | Description |
|-----|-------------|
| **Data Preview** | View cleaned data with statistics |
| **K-Means Clusters** | Interactive cluster visualization |
| **Association Rules** | Discovered product associations |
| **Visualizations** | Charts and graphs |

## 🔧 Technologies

| Technology | Purpose |
|------------|---------|
| R | Programming Language |
| Shiny | Web Application Framework |
| ggplot2 | Data Visualization |
| Plotly | Interactive Charts |
| dplyr | Data Manipulation |
| arules | Association Rules Mining |
| DT | Interactive Tables |

## 📤 Export Options

- **Download Clusters**: Export clustered data as CSV
- **Download Rules**: Export association rules as CSV

## 📊 Analysis Parameters

| Parameter | Default | Range | Description |
|-----------|---------|-------|-------------|
| Clusters | 3 | 2-10 | Number of K-Means clusters |
| Min Support | 0.01 | 0.001-1 | Minimum rule support |
| Min Confidence | 0.1 | 0.001-1 | Minimum rule confidence |

## 🎯 Use Cases

- **Customer Segmentation**: Identify customer groups based on purchasing behavior
- **Market Basket Analysis**: Discover products frequently bought together
- **Sales Analytics**: Analyze spending patterns by age, city, and payment type
- **Business Intelligence**: Data-driven decision making

## 📝 License

This project is licensed under the MIT License.

## 👤 Author

**Mina**

---

<div align="center">

⭐ Star this repository if you found it helpful!

</div>
