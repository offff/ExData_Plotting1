require("sqldf")

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql('household_power_consumption.txt',mySql, sep=";")

Data <-myData

Data$Date_Time <- strptime(paste(myData$Date, myData$Time), format='%d/%m/%Y %H:%M:%S')

plot(Data$Date_Time, Data$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(Data$Date_Time, Data$Sub_metering_2, col='red')
lines(Data$Date_Time, Data$Sub_metering_3, col='blue')
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
