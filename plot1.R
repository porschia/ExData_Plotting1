## Extract the needed dates from the data
file <- read.table("household_power_consumption.txt", header=FALSE, sep=";")
file.sub <- file[file%Date %in% c("01/02/2007", "02/02/2007"),]

## Set the "Global_active_power" to numeric
file.sub$Global_active_power <- as.numeric(file.sub$Global_active_power)
png("plot1.png", width=480, height=480)
hist(file.sub$Global_active_power, col="red", xlab="Global Active Power(kilowatts)", 
     main="Global Active Power")
dev.off()