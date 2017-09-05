install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

animaldata <- AnimalData


dogs <- animaldata[animaldata$Animal.Type == 'Dog',]
cats <- animaldata[animaldata$Animal.Type == 'Cat',]

table(dogs$Intake.Type)

dogs.owner.surrender <- dogs[dogs$Intake.Type == 'Owner Surrender',]

table(dogs.owner.surrender$Outcome.Type)

dogs.ret.home <- dogs.owner.surrender[dogs.owner.surrender$Outcome.Type == 'Return to Owner',]

mean(dogs.ret.home$Days.Shelter)

plot(dogs$Intake.Type)


View(dogs)

