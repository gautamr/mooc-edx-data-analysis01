install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

world <- WorldBankData

# Primary Research Question:
# =========================
# What model best describes the first decade of internet usage (1990-1999) in the United States? Which model is a better long-term fit?
# =========================

# 1a) What is the first “Low Income” country in the dataset?
low <- world[world$IncomeGroup == 'Low income',]
low[1, ]

# 1b) What was the rural population of Aruba in 1970? (Report without commas)
aruba70 <- world[world$Country == 'Aruba' & world$year == 1970,]
aruba70$rural.population

# 1c) When was the first year Australia had data on the number of mobile device subscriptions? (Subscriptions more than 0)
australia <- world[world$Country == 'Australia' & world$mobile.users != 'NA' & world$mobile.users > 0,]
australia


# Prepare for the Analysis:
# ========================
# Let's break this analysis into its required steps:

# 1. Create a subset of the dataset that contains only the information for the United States.
# 2. Create a subset of the US data that contains only the years 1990 to 1999.  
# 3. Use a function to fit both an exponential and a logistic model to the data.  
# 4. Using each model, predict the number of internet users in 2006. 
# 5. Compare the size of the residuals for 2006 to determine which model appears to have better long-term fit.

# Subset data for just the United States and name the new data frame "us"
us <- world[world$Country.Code == "USA",]

# Select the years from 1990 and name the new data frame "us_select"
us_select <- us[us$year >= 1990, ]

# Create a new variable in our datset called internet.mil to make the number of users more interpretable (into millions)
us_select$internet.mil <- us_select$internet.users / 1000000

# Create a new variable in our dataset called time that represents "years since 1990"
us_select$time <- us_select$year - 1990

# Select the first 10 years (from 1990 to 1999) and name the new data frame "us_select_10"
us_select_10 <- us_select[us_select$time < 10,]

# Use a function to fit an exponential and logistic model for 1990-1999
expFit(us_select_10$time, us_select_10$internet.mil)
logisticFit(us_select_10$time, us_select_10$internet.mil)

# Based on the prior model parameters, predict the number of INTERNET users in 2006
e <- expFitPred(us_select_10$time, us_select_10$internet.mil, 16)
l <- logisticFitPred(us_select_10$time, us_select_10$internet.mil, 16)

# 3) What will be the value of "us_select$time" for 2006?
2006 - 1990

# Conduct the Analysis
# ===================

# 3) What was the actual number of internet users (in millions) in the United States in 2006? (Round to 1 decimal place)
us2006 <- us[us$year == 2006, ]
us2006$internet.users / 1000000

# 4a) The exponential model predicted __________ million users in 2006. The residual was _______.
1.87184 * 1.60845 ^ 16

# 4b) The logistic model predicted _______ million users in 2006. The residual was _______.
127.7935 / (1 + 121.4 * 196391^-16)

 205.6768 - 127.7935









