library(sqldf)

setwd("/Users/ryanb/Development/courseraDataScience/ExData_Plotting1")
pdf(file="plot2.pdf") 
householdData <- read.csv.sql('household_power_consumption.txt', 
                              sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", 
                              sep =";",
                              header=TRUE, 
                              stringsAsFactors=FALSE)
householdData$timestamp <- as.POSIXct(paste(householdData$Date, householdData$Time), format="%d/%m/%Y %H:%M:%S")

plot(householdData$timestamp, householdData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()