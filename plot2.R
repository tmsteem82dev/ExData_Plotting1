# author: Tim Steeman
# a directory data should be created in the working directory with the extracted data inside before running this code
totalData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)

# convert Date characters to Date objects
totalData$Date <- as.Date(totalData$Date, format = "%d/%m/%Y" )

# create a new data.frame containing only data for the dates we're interested in
selectedDates <- totalData[which(totalData$Date == as.Date("2007-02-01") | totalData$Date == as.Date("2007-02-02")),]

selectedDates$Global_active_power <- as.numeric(selectedDates$Global_active_power)

# combine the Date and Time columns and then convert them into a datetime object
selectedDates$DateTime <- strptime(paste(selectedDates$Date, selectedDates$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.PNG", width = 480, height = 480)
# plot as type n to make it so that the dots are not drawn
plot(x = selectedDates$DateTime, y=selectedDates$Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()
