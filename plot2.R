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
png(file = "plot2.png") ## Open PNG device, create 'plot2.png' in working directory

with(consumption, plot(datetime, Global_active_power,
                       type = 'l',
                       xlab = "",
                       ylab = "Global Active Power (kilowatts)"))

dev.off() ## Close the PNG file device