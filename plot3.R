## Extract the needed dates from the data
file <- read.table("household_power_consumption.txt", header=FALSE, sep=";")
file.sub <- file[file%Date %in% c("01/02/2007", "02/02/2007"),]

## Combine Date and Time
date.time <- strptime(paste(file.sub$Date, file.sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Extract and set submetering columns to numeric
sub.metering.1 <- as.numeric(file.sub$Sub_metering_1)
sub.metering.2 <- as.numeric(file.sub$Sub_metering_2)
sub.metering.3 <- as.numeric(file.sub$Sub_metering_3)

## Plot data
png("plot3.png", width=480, height=480)
plot(datetime, sub.metering.1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, sub.metering.2, type="l", col="red")
lines(datetime, sub.metering.3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, 
       lwd=2, col=c("black", "red", "blue"))
dev.off()