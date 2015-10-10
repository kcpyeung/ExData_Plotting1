data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

data <- data[as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007", ]

png(filename="plot1.png")

hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="#ff0000")

dev.off()
