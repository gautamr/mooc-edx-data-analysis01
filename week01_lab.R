# install library from local ZIP file
install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

# rename BikeData to bike
bike <- BikeData

#  table to show how many daily riders are in the original dataset.
table(bike$cyc_freq)

# Create a new datafile that includes only the daily riders.
dailyrider <-bike[bike$cyc_freq=='Daily',]

# Make a table to show the number of male and female daily riders.
table(dailyrider$gender)

#  Make a vector of the ages of these daily riders.
ages <- dailyrider$age

# Find average age ridden
mean(ages)
#sdfs

male <- dailyrider[dailyrider$gender == 'M',]

female <- dailyrider[dailyrider$gender == 'F',]

mean(male$age)


mean(female$age)


thirty <- male[male$age >= 30,]

length(thirty)


