install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

# Primary Research Question:
# =========================
# How have the world record times for the men's and the women’s mile event changed over the years?
# =========================

WR <- WorldRecords

# Analysis:
# ========
# Let’s break this question down into the different descriptive statistics that you will need to construct your answer.  Be sure that your R output includes all of the following components.

# 1. Create a subset of the data that contains World Record cases for the men’s Mile event.
# 2. Create a subset of the data that contains World Record cases for the women's Mile event. 
# 3. Create a scatterplot for each relationship of Mile time and year: one for men and one for women.  
# 4. Confirm from these plots that a linear model is appropriate.  
# 5. Run a linear model for each event and then interpret the results. Be sure to calculate R-squared values for each model.

#Subset the data
mensmile <- WR[WR$Event=='Mens Mile',]
womensmile <- WR[WR$Event=='Womens Mile',] 

#Create scatterplots
plot(mensmile$Year, mensmile$Record, main='Mens Mile World Records',xlab='Year',ylab='World Record Time (s))')
plot(womenmile$Year, womensmile$Record, main='Womens Mile World Records',xlab='Year',ylab='World Record Time (s)',pch=16)

#Run linear models
linFit(mensmile$Year, mensmile$Record)
linFit(womensmile$Year, womensmile$Record)

cor(mensmile$Year, mensmile$Record)
cor(womensmile$Year, womensmile$Record)

# Draw Conclusions:
