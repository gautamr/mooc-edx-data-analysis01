install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

animals <- AnimalData

dim(animals)

head(animals)

table(animals$Sex)

# bar chart of categorical data; sex
plot(animals$Sex, main='Bar Chart of Animal Gender', xlab='Animal Gender', ylab = 'Frequency')

# histogram of numerical data; Age of Animal at intake
hist(animals$Age.Intake, main = 'histogram of Intake Age', xlab = 'Age at Intake')

femaleage <- animals$Age.Intake[animals$Sex == 'Female']

maleage <- animals$Age.Intake[animals$Sex == 'Male']

hist(femaleage, main = 'Histogram of female age', xlab = 'Female age at Intake')

hist(maleage, main = 'Histogram of male age', xlab = 'Male age at intake', breaks = 15)

max(maleage)

rownum <- which(animals$Age.Intake == 17)

animals[rownum,]

data <- c(10,   2,   6,   12,   14,   15,   15,   24,   15,   25,   3,   12)