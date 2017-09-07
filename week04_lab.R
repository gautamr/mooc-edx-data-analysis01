# Primary Research Question
# =========================
# Among male artists, is there an association between winning a Grammy and the genre of music that he plays?
# =========================

install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

acl <- AustinCityLimits

# Analysis

# Let’s break this question down into the different descriptive statistics that you will need to construct your answer.  Be sure that your R output includes all of the following components. 

# 1. Subset the data (males only).
# 2. Create a table to show the marginal distributions for Genre and Grammy.
# 3. Create a contingency table to show the conditional distribution for Genre and Grammy.
# 4. Make a bar chart to better visualize how many artists in each Genre received a Grammy.
# 5. Calculate P(A):  the probability of winning a Grammy.
# 6. Calculate P(A|B): the probability of winning Grammy, given the artist's Genre.
# 7. Interpret what these probabilities tell us about the relationship between Genre and winning a Grammy.

# Subset the data (males only).
male <- acl[acl$Gender == 'M',]

# Create tables of marginal distributions
genre <- table(male$Genre)
genre
grammy <- table(male$Grammy)
grammy

# Create contingency table 
ct <- table(male$Grammy, male$Genre)
ct

# Visualize the counts
barplot(ct, legend=T, beside=T)

# Calculate P(A): the probability of winning a Grammy
prop.table(grammy)

# Calculate P(A|B): the probability of winning Grammy, given the artist's Genre.
prop.table(ct, 2)

# Conditional Probabilities

# What is the probability that a randomly selected male artist from each of the following genres won a Grammy? (Report as proportions rounded to three decimal places.)
prob <- prop.table(ct, 2)
round(prob * 100, digits = 3)



    
