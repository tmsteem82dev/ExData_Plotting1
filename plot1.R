# author: Tim Steeman
# a directory data should be created in the working directory with the extracted data inside before running this code
totalData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)

# convert Date characters to Date objects
totalData$Date <- as.Date(totalData$Date, format = "%d/%m/%Y" )

# create a new data.frame containing only data for the dates we're interested in
selectedDates <- totalData[which(totalData$Date == as.Date("2007-02-01") | totalData$Date == as.Date("2007-02-02")),]

# convert character to numeric for Global_active_power otherwise the hist function will result in an error
selectedDates$Global_active_power = as.numeric(selectedDates$Global_active_power)


png(filename = "plot1.PNG", width = 480, height = 480)
hist(selectedDates$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main= "Global Active Power", col="red")
dev.off()

