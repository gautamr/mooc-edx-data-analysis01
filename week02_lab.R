install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

animaldata <- AnimalData

#Find the number of animals that were adopted
table(animaldata$Outcome.Type)

#Pull out only adopted animals
adopted <- animaldata[animaldata$Outcome.Type=="Adoption",]

#Pull out just the days in shelter for the adopted animals
daystoadopt <- adopted$Days.Shelter

#Visualize and describe this variable
hist(daystoadopt)
fivenum(daystoadopt)
mean(daystoadopt)
sd(daystoadopt)
rownum <- which(animaldata$Days.Shelter==max(daystoadopt))

View(animaldata[rownum,])

median(daystoadopt)

z <- (max(daystoadopt) - mean(daystoadopt)) / sd(daystoadopt)
