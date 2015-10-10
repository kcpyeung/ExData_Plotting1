data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

data <- data[as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007", ]

png(filename="plot4.png")

par(mfrow=c(2, 2))

x <- strptime(paste(data[,1], data[, 2]), "%d/%m/%Y %H:%M:%S")

# top left
y <- data[, 3]
plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# top right
y <- data[, 5]
plot(x, y, type="l", xlab="datetime", ylab="Voltage")

# bottom left
y1 <- data[, 7]
y2 <- data[, 8]
y3 <- data[, 9]
plot(x, y1, ylim=range(c(y1, y2, y3)), type="l", xlab="", ylab="Energy sub metering")
par(new = TRUE)
plot(x, y2, ylim=range(c(y1, y2, y3)), type="l", xlab="", ylab="", col="#ff0000")
par(new = TRUE)
plot(x, y3, ylim=range(c(y1, y2, y3)), type="l", xlab="", ylab="", col="#0000ff")
legend("topright", box.lty=0, lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# bottom right
y <- data[, 4]
plot(x, y, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
