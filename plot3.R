library(sqldf)

setwd("/Users/ryanb/Development/courseraDataScience/ExData_Plotting1")
pdf(file="plot3.pdf") 
householdData <- read.csv.sql('household_power_consumption.txt', 
                              sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", 
                              sep =";",
                              header=TRUE, 
                              stringsAsFactors=FALSE)
householdData$timestamp <- as.POSIXct(paste(householdData$Date, householdData$Time), format="%d/%m/%Y %H:%M:%S")

with(householdData, { 
  plot(timestamp, Sub_metering_1, main="", type = "n")
  points(timestamp, Sub_metering_1, col="black", type="l")
  points(timestamp, Sub_metering_2, col="red", type="l")
  points(timestamp, Sub_metering_3, col="blue", type="l")
  legend("topright", col=c("black", "red", "blue"), bty="n", lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.off()