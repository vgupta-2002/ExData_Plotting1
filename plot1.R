# load the data
powerconsumption <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

# subset the data for only two dates
subSetpower <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007") ,]

# convert the column to numeric
subSetpower$Global_active_power <- as.numeric(subSetpower$Global_active_power)

# plot the histogram
hist(subSetpower$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# save as png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
