# Tuberculosis Forecasting and Interactive Dashboard in Wuhan, China

Hi! I’m Ogechi Daniel Koel, a Data Scientist and Biostatistician at DataQuest Solutions. 

In this project, I conducted a comprehensive time series analysis of tuberculosis (TB) incidence in Wuhan, China from 2012 to 2019, using ARIMA/SARIMA models to capture seasonal patterns and long-term trends.

To make the analysis interactive and user-friendly, I also built a Shiny dashboard where you can:

Explore trends and seasonality in TB incidence

View model diagnostics such as residuals and decompositions

Generate forecasts for future TB incidence with just a click

I created this project out of curiosity and a passion for making data insights more accessible. Feel free to explore, fork the repo, or reach out if you have feedback or are working on similar public health projects.
---

## 📦 Features

### 📈 Time Series Analysis

- Seasonal ARIMA model (`SARIMA`) selected via `auto.arima()`.
- Diagnostic plots: trend, seasonality, residuals.
- 3-year TB incidence forecast with confidence intervals.

### 🖥️ Shiny Web App

An interactive dashboard built with `shinydashboard` includes:

- **Home Tab**: Project background and introduction.
- **Dashboard Tab**:
  - Forecasting interface for user-defined months (6–120 months).
  - Dynamic plot and forecast table output.
- **Model Diagnostics Tab**:
  - General trend, decomposed plots.
  - Seasonality visualization.
  - Residual diagnostics (normality, homoscedasticity, autocorrelation).
- **Footer**: Contact and organization info (DataQuest Solutions).

- **Explore the shiny app using this link**: (https://dz01yb-ogechi-koel.shinyapps.io/tb_incidence/)

---

## 📁 Project Structure

```plaintext
📄  data.xlsx                 # Monthly TB incidence data
📄 Tuberculosis.qmd           # Time series report (Quarto format)
📄 app.R                      # Shiny dashboard code
📄 README.md                  # This file


