install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

world <- WorldBankData

# Primary Research Question:
# =========================
# Denmark is a high-income country in Europe of about 5.5 million people. What is the best-fitting model for growth of internet usage in Denmark since 1990?  
# =========================

# Analysis

# Let’s break this question down into the different descriptive statistics that you will need to construct your answer.  Be sure that your R output includes all of the following components. 

# 1. Create a variable that represents proportion of the population using the internet (internet users divided by population).
# 2. Create a subset of the data that only contains data from 1990 onward.
# 3. Create a new variable that is "years since 1990". 
# 4. Create two new data frame for the country of interest.
# 5. Determine the best-fitting model (exponential or logistic) for internet usage in each country from 1990 onward.

# Create a new variable in our datset called internet.prop
world$internet.prop <- world$internet.users / world$population

# Select the years from 1990
world.select <- world[world$year >= 1990, ]

# Create a new variable in our dataset called time that represents "years since 1990"
world.select$time <- world.select$year - 1990

# Subset data for just the DNK
dnk <- world.select[world.select$Country.Code == "DNK",]

# Use a function to fit an exponential and logistic model
expFit(dnk$time, dnk$internet.prop)
logisticFit(dnk$time, dnk$internet.prop)

# Exponential model
# 2a) What is the growth factor for the exponential model? (Round to 3 decimal places.)
a <- 0.00585
round(a, digits = 3)
b <- 1.34666
# 2b) What is the percent growth rate of internet use, according to the exponential model? (Round to a whole-number percentage, but report without using "%")
round((b - 1) * 100, digits = 0)

# Logistic Models
# 3a) What is the carrying capacity in Denmark? (Round to 4 decimal places.)
C <- 0.89668
round(C, digits = 4)

# 3b) What is the value of b (the growth indicator) in Denmark? (Round to 2 decimal places.)
round(1.73124, digits = 2)

# 4a) In what YEAR does the exponential model predict that 70% of the Denmark population would be using the internet? Use the equation to solve. (Round to a whole number.)
t <- log(0.7 / a) / log(b)
1990 + round(t)

# 4b) In what YEAR does the logistic model predict that 70% of the Denmark population would be using the internet? Use an equation to solve. (Round to a whole number.)
t <- log(0.7 * 308.8345 / (C - 0.7)) / log(1.73124)
1990 + round(t)




