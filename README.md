# Tuberculosis Forecasting and Interactive Dashboard in Wuhan, China

This project, developed by **Ogechi Daniel Koel**, provides a comprehensive time series analysis of tuberculosis (TB) incidence in Wuhan, China from **2012 to 2019** using ARIMA/SARIMA models. In addition, an interactive **Shiny dashboard** allows users to explore trends, model diagnostics, and forecast future TB incidence dynamically.

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


