## Reading the data
consumption <- read.table("household_power_consumption.txt",
                          header = TRUE,
                          sep=";",
                          na.strings = "?",
                          stringsAsFactors = FALSE)

## Add a column 'datetime' by concatenating Date & Time
consumption$datetime <- strptime(paste(consumption$Date, consumption$Time), format = "%d/%m/%Y %H:%M:%S")

## Subset the data frame
consumption <- subset(consumption, as.Date(datetime) == as.Date("2007-02-01") | 
                          as.Date(datetime) == as.Date("2007-02-02"))

## Construct the plot
## Default size 480 x 480
png(file = "plot4.png") ## Open PNG device, create 'plot4.png' in working directory

par(mfrow = c(2,2))

##plot 1
with(consumption, plot(datetime, Global_active_power,
                       type = 'l',
                       xlab = "",
                       ylab = "Global Active Power"))

##plot 2
with(consumption, plot(datetime, Voltage, type = "l"))

##plot 3
with(consumption, plot(datetime, Sub_metering_1,
                       ylab = "Energy sub metering",
                       xlab = "",
                       type = "s"))
with(consumption, points(datetime, Sub_metering_2, col = "red", type = "s"))
with(consumption, points(datetime, Sub_metering_3, col = "blue", type = "s"))
legend("topright",
       lty = 1,
       col = c("black", "blue", "red"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##plot 4
with(consumption, plot(datetime, Global_reactive_power, type = "l"))

dev.off() ## Close the PNG file device