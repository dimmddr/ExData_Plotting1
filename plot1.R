data <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = FALSE, 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                   na.strings = "?", skip = 66637, nrows = 2880)
headers <- read.table("household_power_consumption.txt", nrows = 1, sep = ";")
colnames(data) <- unlist(headers)
data$Time <- strptime(data$Time, format = "%T")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
png("Plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()