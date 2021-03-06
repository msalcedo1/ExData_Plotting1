### ExData_Plotting1
### Plot 3
dTable <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
## Update formats
dTable$Date <- as.Date(dTable$Date, "%d/%m/%Y")
## Next step, to reduce RAM ussage, will subset the table to selected data range:
dTable <- subset(dTable,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Combine Date and Time column
dateTime <- paste(dTable$Date, dTable$Time)
dateTime <- setNames(dateTime, "DateTime")
dTable <- dTable[ ,!(names(dTable) %in% c("Date","Time"))]
dTable <- cbind(dateTime, dTable)

## Format dateTime Column
dTable$dateTime <- as.POSIXct(dateTime)

## Reset plot area
par(mfrow=c(1,1))

## Create plot
with(dTable, {
      plot(Sub_metering_1~dateTime, type="l",
           ylab="Global Active Power (kilowatts)", xlab="")
      lines(Sub_metering_2~dateTime,col='Red')
      lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save file and close device
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

