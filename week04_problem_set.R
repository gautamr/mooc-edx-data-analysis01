                                        #

install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

acl <- AustinCityLimits

# Question 1:
# ==========
# You want to see if an artist's popularity on Facebook (whether or not they have 100,000 or more likes) has anything to do with their age.

# 1.  Generate a table to show the number of artists that are "popular" and those that are not.
# 2.  Generate a table to show the number of "popular" artists within each age group.

# 1a. How many artists in the dataset have 100,000 or more likes on Facebook?
table(acl$Facebook.100k)

# 1b. Which age group has the highest number of artists that have 100,000 or more likes on Facebook? (Spell out your answer, i.e. twenties, thirties, forties, etc.)
popular <- acl[acl$Facebook.100k == 1,]
age.group <- table(popular$Age.Group)
age.group

# 1c. For each age group, fill in the proportion of artists who have 100,000 or more likes on Facebook. (Use the appropriate function in R to calculate these, and round to 3 decimal places (i.e. 0.123.)
ct <- table(acl$Facebook.100k, acl$Age.Group)
ct
round(prop.table(ct, 2), digits = 3)

# Question 2:
# ==========
# A high school counselor wants to categorize students according to two variables: their gender (male or female) and their grade level (freshman, sophomore, junior or senior).

# 2a. To how many possible outcomes can students be assigned?
2 * 4

# An Economics professor kept a record of grades earned by the college students in his class, as shown below. (In the US, an "A" is the strongest grade and an "F" is the Weakest.)

t <- matrix(c(5, 10, 9, 10, 6 , 8, 10, 9, 7, 4, 11, 5, 4, 4, 2, 9, 9, 4, 2, 0), ncol = 5, byrow = TRUE)
colnames(t) <- c("A", "B", "C", "D", "F")
rownames(t) <- c("Freshman", "Sophomore", "Junior", "Senior")
t <- as.table(t)

# 2b. What proportion of students in the class received a grade of A? (Round to 2 decimal places.)
tot <-  margin.table(t)
round(margin.table(t, 2) / tot, digits = 2)

# 2c. What proportion of the students were upperclassmen (juniors and seniors)? (Round to 2 decimal places.)
row.sum <- margin.table(t, 1)
row.sum
round((26 + 24) / tot, digits = 2)

# 2d. What is the probability that a freshman received a failing grade of F? (Round to 2 decimal places.)
prop.table(t, 1)

# 2e. What is the probability that a randomly selected student from the class would be a sophomore that received a grade of B? (Round to 2 decimal places.)

round(prop.table(t), digits = 2)

# 2f. What proportion of juniors passed the course with a grade of D or better? (Round to 2 decimal places.)
prop.table(t, 1)
round((0.42307692 + 0.19230769 + 0.15384615 + 0.15384615), digits = 2)

# 2g. What is the probability that a randomly selected student from this class would be a senior? (Report to 2 decimal places.)
round(margin.table(t, 1) / margin.table(t), digits = 2)

# 2h. If a student received a grade of D in the class, what is the probability that the student was a senior? (Round to 2 decimal places.)
round(prop.table(t, 2), digits = 2)

# 2i. Does the probability that a randomly selected student is a senior change if we know that the student received a grade of D in the course?
prop.table(t)

# Question 3
# ==========
# P(A) = 0.35
# P(A and B) = 0.15
# 3b. What is the probability of P(B|A)? (Round to 2 decimal places.)
round(0.15 / 0.35, digits = 2)


# Question 4
# ==========
# A movie theater conducted a survey to determine the movie preferences of men and women. They asked a total of 130 adults (50 women and 80 men) to choose their favorite movie genre out of four choices: Action, Comedy, Horror, or Romance. The results of their survey are shown below.
tbl <- matrix(c(6, 28, 17, 20, 15, 26, 12, 6), ncol = 2, byrow = TRUE)
colnames(tbl) <- c("Women", "Men")
rownames(tbl) <- c("Action", "Comedy", "Horror", "Romance")

tbl <- as.table(tbl)
# 4b. What is the probability that a randomly chosen person from the survey prefers Action films? (Report as a proportion rounded to 2 decimal places.)
# round(prop.table(tbl), digits = 2)
margin.table(tbl, 1) / margin.table(tbl)

# 4c. What is P(Action|Women)? (Report as a proportion rounded to 2 decimal places.)
round(prop.table(tbl, 2), digits = 2)
