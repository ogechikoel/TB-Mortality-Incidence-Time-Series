# Tuberculosis Forecasting in Wuhan, China

This project, authored by **Ogechi Daniel Koel**, analyzes monthly tuberculosis (TB) incidence data in Wuhan, China, from 2012 to 2019. The goal is to build a time series model to **forecast TB incidence for the next three years** using SARIMA, capturing both seasonal effects and long-term trends.

## 📁 Project Structure

- `data/data.xlsx` - The dataset containing monthly TB incidence.
- Quarto (`.qmd`) document - Performs all data processing, visualization, and modeling.
- Output - A Word document with full analysis (as specified via `format: docx` in Quarto).

## 📊 Methods Used

- Time Series Conversion & Visualization
- Seasonal Decomposition
- Model Fitting using `auto.arima()`
- Forecasting future incidence (3 years)
- Model Diagnostics:
  - Normality of residuals
  - Homoscedasticity
  - Autocorrelation via Ljung-Box and ACF

## 📦 Libraries Used

- `tidyverse`
- `forecast`
- `tseries`
- `readxl`
- `here`
- `flextable`

## 📈 Highlights

- TB incidence showed **seasonal patterns**, peaking around March.
- SARIMA model was selected automatically and passed all diagnostic checks.
- Forecasted TB incidence suggests a **declining trend**, potentially due to public health improvements.

