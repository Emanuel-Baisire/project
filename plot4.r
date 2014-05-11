#Reads data from a local directory

data <- read.table("~/twitter/household_power_consumption.txt", header=TRUE, nrows=2100000, sep=";", stringsAsFactors =FALSE)

#Creates a subset to generate data related to the specified date period

subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Making Date reflected from character character to Date format

date<- as.character(as.Date(subset$Date, "%d/%m/%Y"))

# Forming Date and time as one entity

entity<-paste(date,subset$Time)

dateTime <- strptime(entity, "%Y-%m-%d %H:%M:%S")

#Generates Plot4

png("plot4.png",width=480,height=480)

par(mfrow = c(2, 2))

plot(dateTime, as.numeric(subset$Global_active_power), type="l",ylab="Global Active Power", xlab="", cex=0.2)

plot(dateTime, as.numeric(subset$Voltage), type="l",ylab="Voltage", xlab="datetime")

plot(dateTime, as.numeric(subset$Sub_metering_1), type="l",ylab="Energy Submetering", xlab="")

lines(dateTime, as.numeric(subset$Sub_metering_2), typ="l", col="red")

lines(dateTime, as.numeric(subset$Sub_metering_3), type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,col=c("black", "red", "blue"), bty = "n")

plot(dateTime, as.numeric(subset$Global_reactive_power), type="l", xlab="datetime",ylab="Global_reactive_power")

dev.off()

