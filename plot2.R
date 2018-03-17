# load the data
powerconsumption <- read.table("household_power_consumption.txt", header = T, 
                               sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# subset the data for only two dates
subSetpower <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007") ,]

# convert the column to numeric
subSetpower$Global_active_power <- as.numeric(subSetpower$Global_active_power)

# Combine Date and Time
subSetpower$datetime <- strptime(paste(subSetpower$Date, subSetpower$Time, sep = " "), 
                                 "%d/%m/%Y %H:%M:%S")

# Plot
with(subSetpower, plot(datetime, Global_active_power, type="l", xlab="Day", 
                       ylab="Global Active Power (kilowatts)"))

# save as png file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
