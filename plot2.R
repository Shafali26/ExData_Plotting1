# Loading and reading the data

RawFile <- "./data/exdata_2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
data<- read.table(RawFile,header = TRUE, sep=";" , stringsAsFactors = FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#subsetting the data 

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

#calling the plotting function

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()