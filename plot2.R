data <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = FALSE, 
                   colClasses = c("Date", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                   na.strings = "?", skip = 66637, nrows = 2880)
headers <- read.table("household_power_consumption.txt", nrows = 1, sep = ";")
colnames(data) <- unlist(headers)
data$Time <- strptime(data$Time, format = "%T")