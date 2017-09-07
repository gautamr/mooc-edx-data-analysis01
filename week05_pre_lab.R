install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

# Primary Research Question:
# =========================
# How has the men’s shotput world record changed over time?  What about the women’s world record?
# =========================

WR <- WorldRecords

# 1a. How many different types of events (e.g. "Mens 100m," "Womens shotput," etc.) are represented in the dataset?
dim(table(WR$Event))

# 1b. In what year did Usain Bolt first break the world record for the men's 100m dash?

# Prepare for the Analysis:
# ========================
# Let's break this analysis into its required steps:

# 1. Create a subset of the dataset that contains only the World Record cases for men’s shotput.
# 2. Create a subset that contains only the World Record cases for women's shotput. 
# 3. Create a scatterplot of year and record shotput distance: one for men and one for women.  
# 4. Confirm from these plots that a linear model is appropriate.  
# 5. Run a linear model for each event and then interpret the results.

#Subset the data
menshot <- WR[WR$Event=='Mens Shotput',]
womenshot <- WR[WR$Event=='Womens Shot-put',] 

#Create scatterplots
plot(menshot$Year,menshot$Record,main='Mens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
plot(womenshot$Year,womenshot$Record,main='Womens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)

#Run linear models
linFit(menshot$Year, menshot$Record)
linFit(womenshot$Year,womenshot$Record)

# Conduct the Analysis:
# ====================
dim(menshot)
dim(womenshot)


cor(menshot$Year, menshot$Record)

cor(womenshot$Year,womenshot$Record)

# Draw Conclusions:
# ================





#
