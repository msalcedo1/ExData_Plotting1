### ExData_Plotting1
### 
dTable <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
## Update formats
dTable$Date <- as.Date(dTable$Date, "%d/%m/%Y")
## Next step, to reduce RAM ussage, will subset the table to selected data range:
dTable <- subset(dTable,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Combine Date and Time column
## dateTime <- paste(dTable$Date, dTable$Time)

## Reset plot area
par(mfrow=c(1,1))

## Create the histogram
hist(dTable$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

## Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

