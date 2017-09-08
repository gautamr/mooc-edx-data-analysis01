# 1. What is the growth factor in each of the following scenarios?  (Assume time is measured in the units given; round answers to 2 decimal places.)

# 1a. Water usage is increasing by 3% per year. (Round answers to 2 decimal places.)
b <- 1 + 3 / 100

# 1b. A city grows by 28% per decade. (Round answers to 2 decimal places.)
b <- 1 + 28 / 100

# 1c. A diamond mine is depleted by 1% per day. (Round answers to 2 decimal places.)
b <- 1 - 1 / 100
b

# 1d. A forest shrinks 80% per century. (Round answers to 2 decimal places.)
b <- 1 - 80 / 100
b

# 2. The amount (in milligrams) of a drug in the body t hours after taking a pill is given by:
# A(t)=25(0.85)t
25 * (0.85)^0

# 2b. What percent of the drug leaves the body each hour? (Report without the % sign.)
# b = 0.85 = 1 - 0.15
0.15 * 100

# 2c. What is the amount of the drug left after 10 hours? (Round to 2 decimal places; report in milligrams.)
round(25 * (0.85)^10, digits = 2)

























