install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

animaldata <- AnimalData


View(animaldata)

adultanimals <- animaldata[animaldata$Age.Intake >= 1,]

table(adultanimals$Animal.Type)

adultdogs <- adultanimals[adultanimals$Animal.Type == 'Dog',]
adultcats <- adultanimals[adultanimals$Animal.Type == 'Cat',]

adult.cat.weight <- adultcats$Weight


hist(adult.cat.weight)

m <- mean(adult.cat.weight)

s <- sd(adult.cat.weight)

fivenum(adult.cat.weight)


z <- (13 - mean(adultcats$Weight)) / sd(adultcats$Weight)
1 - pnorm(z)

zdog <- (13 - mean(adultdogs$Weight)) / sd(adultdogs$Weight)

dog.adult.weight <- adultdogs$Weight

hist(dog.adult.weight)

dog.adult.weight.median <- median(dog.adult.weight)

fivenum(dog.adult.weight)

median(adult.cat.weight)



