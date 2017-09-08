install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

world <- WorldBankData

# Question 1:
# ==========
# How has mobile phone usage in Brazil changed since 1995?

# 1. Create a subset of the world bank data that contains records from Brazil 1995 and later.
# 2. Change the year variable to be "years since 1995" and update the units of the "mobile.users" variable to millions of users. 
# 3. Use this data to answer the following questions.
bra95 <- world[world$Country.Code == 'BRA' & world$year >= 1995, ]

# Create a new variable in our datset called mobile.mil to make the number of users more interpretable (into millions)
bra95$mobile.mil <- bra95$mobile.users / 1000000

# Create a new variable in our dataset called time that represents "years since 1995"
bra95$time <- bra95$year - 1995

# 1a. the number of mobile users in Brazil (in millions) in 2000. (Round to 2 decimal places.)
bra2000 <- bra95[bra95$year == 2000,]
round(bra2000$mobile.mil, digits = 2)


plot(bra95$time, bra95$mobile.mil)
linFit(bra95$time, bra95$mobile.mil)
expFit(bra95$time, bra95$mobile.mil)
logisticFit(bra95$time, bra95$mobile.mil)

# 1e. Using the best‐fitting model, predict the number of mobile users (in millions) in Brazil in 2025. (Round to a whole number.)
347.9316 / (1 + 72.74891 * 1.3595 ^(-35))

# Question 2:
# ==========
# 2a. Looking at the raw data, what is the rate of change in flu cases from April 30 to May 1? (Report as a proportion rounded to 2 decimal places.)
round((367 - 257) / 257, digits = 2)

# 2c. Predict the number of cases of flu on Day 14 (when "Day" is equal to 14), using the exponential model. (Round to a whole number, without a comma)
round(76.64 * (1.46 ^ 14))

# 2d. Using the logistic model, predict the total number of flu cases on Day 14. (Round to a whole number, without a comma.)
round(3273.31 / (1 + 43.59 * (1.57 ^ -14)))

# Question 3:
# ==========

# 3c. Another researcher assumed that the wolves would experience exponential growth because there were no predators. He fit an exponential model to this data. What is the growth factor for this model? (Round to 2 decimal places.)
(35 - 25) / 25


25 / 1.34


log(325 / 19) / log(1.34)


log(152.10) / log(2.17)

2000 / (1 + (152.10 * (2.17 ^ -9)))



