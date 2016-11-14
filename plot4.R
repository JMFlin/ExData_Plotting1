my_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
my_subset <- my_data[my_data$Date %in% c("1/2/2007", "2/2/2007"), ]

a <- strptime(paste(my_subset$Date, my_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(a, as.numeric(my_subset$Global_active_power), type="l", xlab="", ylab="Global Active Power")
plot(a, as.numeric(my_subset$Voltage), type="l", xlab="datetime", ylab="Voltage")
plot(a, as.numeric(my_subset$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(a, as.numeric(my_subset$Sub_metering_2), type="l", col="red")
lines(a, as.numeric(my_subset$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col=c("black", "red", "blue"), bty="o")
plot(a, as.numeric(my_subset$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
