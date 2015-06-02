## Extract the needed dates from the data
file <- read.table("household_power_consumption.txt", header=FALSE, sep=";")
file.sub <- file[file%Date %in% c("01/02/2007", "02/02/2007"),]

## Set the "Global_active_power" to numeric
file.sub$Global_active_power <- as.numeric(file.sub$Global_active_power)

## Combine Date and Time
date.time <- strptime(paste(file.sub$Date, file.sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Plot data
png("plot2.png", width=480, height=480)
plot(datetime, file.sub$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power(kilowatts)")
dev.off()