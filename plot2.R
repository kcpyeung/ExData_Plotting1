data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

data <- data[as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007", ]

x <- strptime(paste(data[,1], data[, 2]), "%d/%m/%Y %H:%M:%S")

y <- data[, 3]

png(filename="plot2.png")

plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
