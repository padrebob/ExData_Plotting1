## Reading the data
consumption <- read.table("household_power_consumption.txt",
                          header = TRUE,
                          sep=";",
                          na.strings = "?",
                          stringsAsFactors = FALSE)

consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")

## consumption$Time <- strptime(consumption$Time, format = "%H:%M:%S")

consumption <- subset(consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

## Construct the plot
## Default size 480 x 480
png(file = "plot1.png") ## Open PNG device, create 'plot1.png' in working directory

hist(consumption$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off() ## Close the PNG file device