d = read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = T, na.strings = "?")
d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
d <- d[d$Date >= "2007-02-01" & d$Date <= "2007-02-02",]
d$Global_active_power <- as.numeric(d$Global_active_power)

png("plot1.png", width=480, height=480)

hist(d[, "Global_active_power"],
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

dev.off()