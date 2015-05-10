data <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = FALSE, 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                   na.strings = "?", skip = 66637, nrows = 2880)
headers <- read.table("household_power_consumption.txt", nrows = 1, sep = ";")
colnames(data) <- unlist(headers)
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
png("Plot3.png")
plot(datetime, data$Sub_metering_1, type = "l",  ylab = "Energy sub metering", xlab = "")
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
dev.off()