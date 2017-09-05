install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

riders <- BullRiders

# Subset the dataset for riders that had at least 1 ride in the 2014 season
riders14 <- riders[riders$Rides14 > 0,]

# Create a new variable or vector for the average number of rides per event for each bull rider
rides.per.event14 <- riders14$Rides14 / riders14$Events14

# histogram and five point summary
hist(rides.per.event14)
fivenum(rides.per.event14)

# 1a. What is the minimum value? (Round to 2 decimal places.)
round(min(rides.per.event14), digits = 2)

# 1b. What is the median?
median(rides.per.event14)

# Create a scatterplot of "rides per event" and yearly ranking (defined by the "Rank14" variable) and add a line of best fit
plot(rides.per.event14, riders14$Rank14)
abline(lm(riders14$Rank14~rides.per.event14))

# 1e. What is the correlation coefficient for rides per event and yearly ranking? (Report to 3 decimal places)
round(cor(rides.per.event14, riders14$Rank14), digits = 3)



# Question 2
study <- c(30, 45, 180, 95, 130, 140, 30, 80, 60, 110, 0, 80)
grade <- c(74, 68, 87, 90, 94, 84, 92, 88, 82, 93, 65, 90)

# 2a. What is the correlation coefficient based on the data? (Round to 3 decimal places.)
r <- round(cor(study, grade), digits = 3)

# 2b. Approximately what percentage of the variation in exam scores can be explained by the amount of time that each student studied? (Roune to whole number without a % sign.)
round(r * r * 100, digits = 0)

# 2c. Create a scatterplot of the data (exam grades and time spent studying). What is the value of the outlier (the student that got a high grade but didn't study very long)?
plot(study, grade)
abline(lm(grade~study))

df <- data.frame(study, grade)
outlier <- df[df$study < 50 & df$grade > 90,]
View(outlier)

# 2d. When the outlier is removed, what is the new value of r? (Round to 3 decimal places.)
outlier.idx <- which(df$study < 50 & df$grade > 90)
nooutlier <- df[-c(outlier.idx),]
round(cor(nooutlier$study, nooutlier$grade), digits = 3)



























