data <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = FALSE, 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                   na.strings = "?", skip = 66637, nrows = 2880)
headers <- read.table("household_power_consumption.txt", nrows = 1, sep = ";")
colnames(data) <- unlist(headers)
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
plot(datetime, data$Global_active_power, type = "l",  ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot2.png")
dev.off()