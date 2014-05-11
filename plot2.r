#Reads data from a local directory

data <- read.table("~/twitter/household_power_consumption.txt", header=TRUE, nrows=2100000, sep=";", stringsAsFactors =FALSE)

#Creates a subset to generate data related to the specified date period

subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Making Date reflected from character character to Date format

date <- as.character(as.Date(subset$Date, "%d/%m/%Y"))

# Forming Date and time as one entity

entity<- paste(date, subset$Time)

dateTime <- strptime(entity, "%Y-%m-%d %H:%M:%S")

#Generates Plot2
png("plot2.png", width = 480, height = 480)

plot(dateTime, as.numeric(subset$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
