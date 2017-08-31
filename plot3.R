# author: Tim Steeman
# a directory data should be created in the working directory with the extracted data inside before running this code
totalData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)

# convert Date characters to Date objects
totalData$Date <- as.Date(totalData$Date, format = "%d/%m/%Y" )

# create a new data.frame containing only data for the dates we're interested in
selectedDates <- totalData[which(totalData$Date == as.Date("2007-02-01") | totalData$Date == as.Date("2007-02-02")),]


selectedDates$Sub_metering_1 <- as.numeric(selectedDates$Sub_metering_1)
selectedDates$Sub_metering_2 <- as.numeric(selectedDates$Sub_metering_2)
selectedDates$Sub_metering_3 <- as.numeric(selectedDates$Sub_metering_3)

# combine the Date and Time columns and then convert them into a datetime object
selectedDates$DateTime <- strptime(paste(selectedDates$Date, selectedDates$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.PNG", width = 480, height = 480)
plot(x=selectedDates$DateTime, y=selectedDates$Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering")
lines(x=selectedDates$DateTime, y=selectedDates$Sub_metering_1, col="black")
lines(x=selectedDates$DateTime, y=selectedDates$Sub_metering_2, col="red")
lines(x=selectedDates$DateTime, y=selectedDates$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1))
dev.off()
