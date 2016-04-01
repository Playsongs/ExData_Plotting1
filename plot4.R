## plot4.R
## Reads household power consumption and selects data for dates (2002/02/01 and 2007/02/02)
## Data is checked and coerced for date and numeric
## Prints 4 graphs in a 2x2 matrix to plot4.png
## Data is checked and coerced for date and numeric
{
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")
feb_hpc <- subset(hpc, Date=="2007-02-01"|Date=="2007-02-02")
rm(hpc)
if (!is.numeric(feb_hpc$Global_active_power))
  feb_hpc$Global_active_power <- as.numeric(feb_hpc$Global_active_power)
feb_hpc$Date <- paste(feb_hpc$Date,feb_hpc$Time)
feb_hpc$Date <- strptime(feb_hpc$Date,"%Y-%m-%d %H:%M:%S")
if (!is.numeric(feb_hpc$Sub_metering_1))
  feb_hpc$Sub_metering_1 <- as.numeric(feb_hpc$Sub_metering_1)
if (!is.numeric(feb_hpc$Sub_metering_2))
  feb_hpc$Sub_metering_2 <- as.numeric(feb_hpc$Sub_metering_2)
if (!is.numeric(feb_hpc$Sub_metering_3))
  feb_hpc$Sub_metering_3 <- as.numeric(feb_hpc$Sub_metering_3)
if (!is.numeric(feb_hpc$Voltage))
  feb_hpc$Voltage <- as.numeric(feb_hpc$Voltage)
png(file = "plot4.png", bg = "white")
par(mfrow = c(2, 2)) 
plot(feb_hpc$Date,feb_hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(feb_hpc$Date,feb_hpc$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(feb_hpc$Date,feb_hpc$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(feb_hpc$Date,feb_hpc$Sub_metering_2,type="l",col="red")
lines(feb_hpc$Date,feb_hpc$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, bty="n",col=c("black", "red", "blue"))
plot(feb_hpc$Date,feb_hpc$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
rm(feb_hpc)
dev.off()
}