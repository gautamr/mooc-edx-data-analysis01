install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

WR <- WorldRecords

# Question 1:
# ==========
# We want to find the best-fitting linear model for men's pole vault world records since 1970.
# ==========

# 1.  Create a new data frame that contains the world record cases in the men's pole vault event in years 1970 and later. 
menspv <- WR[WR$Event=='Mens Polevault' & WR$Year >= 1970,]

#Create scatterplots
plot(menspv$Year, menspv$Record, main = 'Mens Polevault World Record', xlab = 'Year', ylab = 'World Record distance (m)')

linFit(menspv$Year, menspv$Record)

# Question 2:
# ==========
# 
C <- c(140, 280, 420, 560)
h <- c(0, 2, 4, 6)

linFit(h, C)


round(2.84 + 0.04 * 970, digits = 2)
# Draw Conclusions:
