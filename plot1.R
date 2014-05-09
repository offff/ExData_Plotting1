require("sqldf")

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql('household_power_consumption.txt',mySql, sep=";")

Data <-myData
Data$Date <-as.Date(Data$Date, format="%d/%m/%Y")
Data$Time <-strptime(Data$Time, format="%H:%M:%S")

hist(Data$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)', ylab='Frequency')