require("sqldf")

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql('household_power_consumption.txt',mySql, sep=";")

Data <-myData

Data$Date_Time <- strptime(paste(myData$Date, myData$Time), format='%d/%m/%Y %H:%M:%S')

plot(Data$Date_Time, Data$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
