d = read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = T, na.strings = "?")
d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
d <- d[d$Date >= "2007-02-01" & d$Date <= "2007-02-02",]
d$Global_active_power <- as.numeric(d$Global_active_power)
d$Datetime = paste(d$Date, d$Time)
d$Datetime <- as.POSIXct(d$Datetime)


png("plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

plot(d$Global_active_power ~ d$Datetime, type = "l", ylab = "Global Active Power", xlab = "")
plot(d$Voltage ~ d$Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
plot(d$Sub_metering_1 ~ d$Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(d$Sub_metering_2 ~ d$Datetime, col = 'red')
lines(d$Sub_metering_3 ~ d$Datetime, col = 'blue')

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(d$Global_reactive_power ~ d$Datetime, type = "l", ylab = "Global_rective_power", xlab = "datetime")


dev.off()
