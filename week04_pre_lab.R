# Primary Research Question
# =========================
# For artists age 30 or older, do female artists play different kinds of music on Austin City Limits than male artists?
# =========================

install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

acl <- AustinCityLimits

# 1a. How many artists are in this dataset?
dim(acl)

# 1b. How many of the first 10 artists in the dataset were Grammy winners?
first10 <- acl[1:10,]
table(first10$Grammy)

# 1c) What genre was played by the first female artist in the dataset who was over 60 years of age? Match the case of the genre as it appears in the dataset.
artists <- acl[acl$Gender == 'F' & acl$Age > 60,]
artists[1,]$Genre

# Check the Variables of Interest


# Breakdown Your Analysis

# Let's break this analysis into its required steps:

# 1. Create a subset of the data for artists age 30 or older.
# 2. Create a table to show the marginal distribution for each variable.  
# 3. Create a contingency table to show the conditional distribution for gender and genre.  
# 4. Make a bar chart to better visualize how many male and female artists played in each genre.
# 5. Calculate P(A):  the probability of each type of music (genre) being played.
# 6. Calculate P(A|B):  the probability of each genre, given the artist’s gender.
# 7. Interpret what these probabilities tell us about the relationship between genre and gender. 

#Subset the data for artists age 30 or older
older <-acl[acl$Age>=30,]

# Create tables of marginal distributions
genre <- table(older$Genre)
genre
gender <- table(older$Gender)
gender

# Create contingency table 
twoway <- table(older$Gender,older$Genre)
twoway

# Visualize the counts
barplot(twoway, legend=T, beside=T)

# Calculate P(A): the probability of each genre being played
prop.table(genre)

# Calculate P(A|B): the probability of each genre being played, given the artist’s gender
prop.table(twoway,1)


# Primary Research Question
# =========================
#For artists age 30 or older, do female artists play different kinds of music on Austin City Limits than male artists?
# =========================
# 1a. How many male artists are in the 30+ year old artist subset of the Austin City Limits dataset?
male.older <- acl[acl$Gender == 'M' & acl$Age >= 30,]

# 1b. How many female artists are in the 30+ year old artist subset of the Austin City Limits dataset?
female.older <- acl[acl$Gender == 'F' & acl$Age >= 30,]
























