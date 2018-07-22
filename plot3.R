d = read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = T, na.strings = "?")
d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
d <- d[d$Date >= "2007-02-01" & d$Date <= "2007-02-02",]
d$Global_active_power <- as.numeric(d$Global_active_power)
d$Datetime = paste(d$Date, d$Time)
d$Datetime <- as.POSIXct(d$Datetime)

png("plot3.png", width=480, height=480)

plot(d$Sub_metering_1 ~ d$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(d$Sub_metering_2 ~ d$Datetime, col = 'red')
lines(d$Sub_metering_3 ~ d$Datetime, col = 'blue')

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()