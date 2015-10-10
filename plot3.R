data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

data <- data[as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007", ]

x <- strptime(paste(data[,1], data[, 2]), "%d/%m/%Y %H:%M:%S")

y1 <- data[, 7]
y2 <- data[, 8]
y3 <- data[, 9]

png(filename="plot3.png")

plot(x, y1, ylim=range(c(y1, y2, y3)), type="l", xlab="", ylab="Energy sub metering")
par(new = TRUE)
plot(x, y2, ylim=range(c(y1, y2, y3)), type="l", xlab="", ylab="", col="#ff0000")
par(new = TRUE)
plot(x, y3, ylim=range(c(y1, y2, y3)), type="l", xlab="", ylab="", col="#0000ff")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
