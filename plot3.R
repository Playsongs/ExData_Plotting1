## plot3.R
## Reads household power consumption and selects data for dates (2002/02/01 and 2007/02/02)
## Data is checked and coerced for date and numeric
## Prints a graph to plot3.png of the selected sub metering 1-3 data
## Data is checked and coerced for date and numeric
{
hpc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")
feb_hpc <- subset(hpc, Date=="2007-02-01"|Date=="2007-02-02")
rm(hpc)
feb_hpc$Date <- paste(feb_hpc$Date,feb_hpc$Time)
feb_hpc$Date <- strptime(feb_hpc$Date,"%Y-%m-%d %H:%M:%S")
if (!is.numeric(feb_hpc$Sub_metering_1))
  feb_hpc$Sub_metering_1 <- as.numeric(feb_hpc$Sub_metering_1)
if (!is.numeric(feb_hpc$Sub_metering_2))
  feb_hpc$Sub_metering_2 <- as.numeric(feb_hpc$Sub_metering_2)
if (!is.numeric(feb_hpc$Sub_metering_3))
  feb_hpc$Sub_metering_3 <- as.numeric(feb_hpc$Sub_metering_3)
png(file = "plot3.png", bg = "white")
plot(feb_hpc$Date,feb_hpc$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(feb_hpc$Date,feb_hpc$Sub_metering_2,type="l",col="red")
lines(feb_hpc$Date,feb_hpc$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()
rm(feb_hpc)
}