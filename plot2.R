d = read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = T, na.strings = "?")
d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
d <- d[d$Date >= "2007-02-01" & d$Date <= "2007-02-02",]
d$Global_active_power <- as.numeric(d$Global_active_power)
d$Datetime = paste(d$Date, d$Time)
d$Datetime <- as.POSIXct(d$Datetime)

png("plot2.png", width=480, height=480)

plot(d$Global_active_power ~ d$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()