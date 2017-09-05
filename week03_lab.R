install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

riders <- BullRiders


# Primary Research Question:
# ==========================
# In 2012, which variable had the strongest linear relationship with Earnings:  Ride Percentage or Cup Points?
# ==========================

# Analysis

# Let’s break this analysis into the different steps that you will need to take to construct a complete answer.  Be sure to:

# 1. Create a dataset which contains riders that participated in at least one event in 2012.
# 2. Make a histogram to visualize the distribution of Earnings for 2012.
# 3. Generate the appropriate descriptive statistics for this distribution.
# 4. Make a correlation matrix for Earnings12, RidePer12 and CupPoints12.
# 5. Plot a scatterplot for Earnings12 with each variable of interest.  Put Earnings12 on the y-axis.  Check for outliers.
# 6. Determine which variable has the strongest linear relationship with Earnings12.

riders12 <- riders[riders$Events12 > 0,]
View(riders12)
hist(riders12$Earnings12)
cols <- c('Earnings12', 'RidePer12', 'CupPoints12')
cor(riders12[,cols])
# What was the average amount earned by a bull rider? (Choose the appropriate measure of center; report without a $ sign and round to the nearest whole number.)
round(median(riders12$Earnings12), digits = 0)

# What was the highest amount earned by a bull rider?
round(max(riders12$Earnings12), digits = 0)

# Make a Scatterplot of Earnings and Ride Percentage
plot(riders12$RidePer12, riders12$Earnings12)

# 2b. What is the correlation of Earnings with Ride Percentage for 2012? (round to three decimal places)
round(cor(riders12[,cols]), digits = 3)

# Create a Scatterplot of Earnings and Cup Points
plot(riders12$CupPoints12, riders12$Earnings12)


# Outliers and Influential Points
# identify specific case
r <- which(riders12$Earnings12 == max(riders12$Earnings12))
View(riders12[r,])
t <- riders12[r,]
t$Rank12

# 4b. Where does this data point fall in the scatterplot? (Make sure that Earnings12 is on the y-axis)
abline(lm(riders12$Earnings12~riders12$CupPoints12))

#Subset the data
nooutlier <- riders12[riders12$Earnings12 < 1000000,]

# rerun the correlation matrix and the scatterplots to see the difference
round(cor(nooutlier[, cols]), digits = 3)
plot(nooutlier$CupPoints12, nooutlier$Earnings12)
abline(lm(nooutlier$Earnings12~nooutlier$CupPoints12))





