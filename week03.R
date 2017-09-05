install.packages("./SDSFoundations_1.4.zip", repos = NULL)

# load the library in current session
library(SDSFoundations)

riders <- BullRiders

View(riders)

plot(riders$YearsPro, riders$BuckOuts12, main = 'Plot of Years Pro vs Buckouts12', xlab = 'Years Pro', ylab = 'Buckouts12')
abline(lm(riders$BuckOuts12~riders$YearsPro))

plot(riders$YearsPro, riders$BuckOuts13, main = 'Plot of Years Pro vs Buckouts13', xlab = 'Years Pro', ylab = 'Buckouts13')
abline(lm(riders$BuckOuts12~riders$YearsPro))

plot(riders$YearsPro, riders$BuckOuts14, main = 'Plot of Years Pro vs Buckouts14', xlab = 'Years Pro', ylab = 'Buckouts14')
abline(lm(riders$BuckOuts12~riders$YearsPro))

plot(riders$Events12, riders$BuckOuts12, main = 'Plot of Events12 vs Buckouts12', xlab = 'Events12', ylab = 'Buckouts12')
abline(lm(riders$BuckOuts12~riders$Events12))
