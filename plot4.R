library(sqldf)

setwd("/Users/ryanb/Development/courseraDataScience/ExData_Plotting1")
pdf(file="plot4.pdf") 
householdData <- read.csv.sql('household_power_consumption.txt', 
                              sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", 
                              sep =";",
                              header=TRUE, 
                              stringsAsFactors=FALSE)
householdData$timestamp <- as.POSIXct(paste(householdData$Date, householdData$Time), format="%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with (householdData, {
  plot(timestamp, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

  plot(timestamp, Voltage, type="l", xlab="datetime", ylab="Voltage")

  plot(timestamp, Sub_metering_1, main="", type = "n", xlab="", ylab="Energy sub metering")
  points(timestamp, Sub_metering_1, col="black", type="l")
  points(timestamp, Sub_metering_2, col="red", type="l")
  points(timestamp, Sub_metering_3, col="blue", type="l")
  legend("topright", col=c("black", "red", "blue"), bty="n", lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  plot(timestamp, Global_reactive_power, type="l", xlab="datetime")
})


dev.off()