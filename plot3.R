# load the data
powerconsumption <- read.table("household_power_consumption.txt", header = T, 
                               sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# subset the data for only two dates
subSetpower <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007") ,]

# convert the columns to numeric
subSetpower$Sub_metering_1 <- as.numeric(subSetpower$Sub_metering_1)
subSetpower$Sub_metering_2 <- as.numeric(subSetpower$Sub_metering_2)
subSetpower$Sub_metering_3 <- as.numeric(subSetpower$Sub_metering_3)

# Combine Date and Time
subSetpower$datetime <- strptime(paste(subSetpower$Date, subSetpower$Time, sep = " "), 
                                 "%d/%m/%Y %H:%M:%S")

# Plot
png("plot3.png", width=480, height=480)
with(subSetpower, plot(datetime, Sub_metering_1, type="l", xlab="", 
                       ylab="Energy sub metering"))

lines(subSetpower$datetime, subSetpower$Sub_metering_2, type="l", col="red")
lines(subSetpower$datetime, subSetpower$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, 
        col = c("black", "red", "blue"))

dev.off()
