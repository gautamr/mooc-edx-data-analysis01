BikeData <- read.csv("./data/BikeData.csv")
View(BikeData)

# frequency of categorical data column, 'gender'
table(BikeData$gender)

# filter data frame where gender column == 'F'
females <- BikeData[BikeData$gender == 'F',]

# filter vector of speed where gender column == 'F'
femalespeed <- BikeData$speed[BikeData$gender == 'F']

# mean()
mean(femalespeed)

# vectors
myvariable <- c(12, 23, 34, 45, -12)
mean(myvariable)
