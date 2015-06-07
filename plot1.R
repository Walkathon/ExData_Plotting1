library(sqldf)

setwd("/Users/ryanb/Development/courseraDataScience/ExData_Plotting1")
pdf(file="plot1.pdf") 
householdData <- read.csv.sql('household_power_consumption.txt', 
                              sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", 
                              sep =";",
                              header=TRUE, 
                              stringsAsFactors=FALSE)

hist(householdData$Global_active_power, 
     xlab="Global Active Power (kilowatts)", 
     col="red",  
     main="Global Active Power")
dev.off() 