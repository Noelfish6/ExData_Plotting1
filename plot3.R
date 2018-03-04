# download the data and unzip it
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")
unzip ("household_power_consumption.zip", exdir = "./")

# load the data
data <- read.table(file = "household_power_consumption.txt", sep=";",header = TRUE,na.strings="?") 

# subset the data
newData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# format date and time
newData$Date <- as.Date(newData$Date, format="%d/%m/%Y")
dateTime <- paste(newData$Date, newData$Time)
newData$DateTime <- as.POSIXct(dateTime)

# plot 3
with(newData, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime, col='Red')
  lines(Sub_metering_3~DateTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# export the png file
dev.copy(png,'plot3.png', height=480, width=480)
dev.off()
