#Reads data from a local directory

data <- read.table("~/twitter/household_power_consumption.txt", header=TRUE, nrows=2100000, sep=";", stringsAsFactors =FALSE)

#Creates a subset to generate data related to the specified date period

subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Making Date reflected from character character to Date format

date<- as.character(as.Date(subset$Date, "%d/%m/%Y"))

# Forming Date and time as one entity

entity<-paste(date,subset$Time)

dateTime <- strptime(entity, "%Y-%m-%d %H:%M:%S")

#Generates Plot3

png("plot3.png",width=480,height=480)

plot(dateTime, as.numeric(subset$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")

lines(dateTime, as.numeric(subset$Sub_metering_2), type="l", col="red")

lines(dateTime, as.numeric(subset$Sub_metering_3), type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,col=c("black", "red", "blue"))

dev.off()

