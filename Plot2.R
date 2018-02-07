### ExData_Plotting1
### Plot 2
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
plot(dTable$Global_active_power~dTable$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save file and close device
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

