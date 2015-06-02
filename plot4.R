## Extract the needed dates from the data
file <- read.table("household_power_consumption.txt", header=FALSE, sep=";")
file.sub <- file[file%Date %in% c("01/02/2007", "02/02/2007"),]

## Combine Date and Time
date.time <- strptime(paste(file.sub$Date, file.sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Extract and set needed columns to numeric
sub.metering.1 <- as.numeric(file.sub$Sub_metering_1)
sub.metering.2 <- as.numeric(file.sub$Sub_metering_2)
sub.metering.3 <- as.numeric(file.sub$Sub_metering_3)
global.active.power <- as.numeric(file.sub$Global_active_power)
global.reactive.power <- as.numeric(file.sub$Global_reactive_power)
voltage <- as.numeric(file.sub$Voltage)

## Plot data
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(2.5,4,0.5,2))

plot(datetime, global.active.power, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub.metering.1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, sub.metering.2, type="l", col="red")
lines(datetime, sub.metering.3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=2, col=c("black", "red", "blue"), bty="n")

plot(datetime, global.reactive.power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
