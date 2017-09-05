install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

riders <- BullRiders

# How many observations are in the dataset?
View(riders)
dim(riders)

# How many of the first 10 riders in the dataset have been pro for 10 years or more?
first.10 <- riders[1:10, ]
View(first.10)
table(first.10$YearsPro)
pro <- first.10[first.10$YearsPro >= 10,]
View(pro)
dim(pro)

# Of the top 15 riders so far in 2015, how many rides were completed by the rider with the fewest buck-outs in 2014?
# Rank15 is already sorted
top15 <- riders[riders$Rank15 <= 15,]
View(top15)

therider <- top15[top15$BuckOuts14 == min(top15$BuckOuts14),]
total.rides = therider$Rides12 + therider$Rides13 + therider$Rides14

#  Which variable tells us the number of times a rider stayed on his bull for the full 8 seconds in 2013?       
therider$RidePer13

# 1. Prepare for the Analysis
# Primary Research Question:
# =========================
# For the 2013 season, Is there a linear relationship between how often a rider places in the Top 10 and the number of times he stayed on his bull for a full 8 seconds?
# =========================

#Subset for riders that participated in at least one event in 2013
new_bull <- riders[riders$Events13  > 0,]

# Visualize and describe the first variable of interest
hist(new_bull$Rides13)
fivenum(new_bull$Rides13)
mean(new_bull$Rides13)
sd(new_bull$Rides13)

# Visualize and describe the second variable of interest
hist(new_bull$Top10_13)
fivenum(new_bull$Top10_13)
mean(new_bull$Top10_13)
sd(new_bull$Top10_13)

# Create a scatterplot
plot(new_bull$Rides13,new_bull$Top10_13)

# Add line of best fit
abline(lm(new_bull$Top10_13~new_bull$Rides13))

# Calculate the correlation coefficient
cor(new_bull$Rides13,new_bull$Top10_13)

# Create a correlation matrix 
vars <- c("Top10_13", "Rides13")
cor(new_bull[,vars])

# 2. Conduct the Analysis
# Primary Research Question:
# =========================
# For the 2013 season, is there a linear relationship between how often a rider placed in the Top 10 and the number of times he stayed on his bull for a full 8 seconds?
# =========================

# What do the histogram and descriptive statistics tell us about the distribution of the Rides13 variable?

# On average, a bull rider in 2013 has how many rides? (Report the median becuase the histogram is not symmetrical.)
median(new_bull$Rides13)
# These bull riders made it into the Top 10 an average of ________ times in 2013.
median(new_bull$Top10_13)

# The correlation, rounded to three decimal places, between the number of Top 10 appearances and the number of successful rides for 2013
round(cor(new_bull[,vars]), 3)

#identify a specific record
which(new_bull$Top10_13==2 & new_bull$Rides13==22)
View(new_bull[4,])






