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

# plot 2
plot(newData$Global_active_power~newData$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# export the png file
dev.copy(png,'plot2.png', height=480, width=480)
dev.off()
