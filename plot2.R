## plot2.R
## Reads household power consumption and selects data for dates (2002/02/01 and 2007/02/02)
## Data is checked and coerced for date and numeric
## Prints a graph to plot2.png of the selected dates and global active power
## Data is checked and coerced for date and numeric
{
library(lubridate)
hpc <- read.table("household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactors=FALSE)
if (!is.Date(hpc$Date))
  hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")
feb_hpc <- subset(hpc, Date=="2007-02-01" | Date == "2007-02-02")
rm(hpc)
if (!is.numeric(feb_hpc$Global_active_power))
  feb_hpc$Global_active_power <- as.numeric(feb_hpc$Global_active_power)
feb_hpc$Date <- paste(feb_hpc$Date,feb_hpc$Time)
feb_hpc$Date <- strptime(feb_hpc$Date,"%Y-%m-%d %H:%M:%S")
png(file = "plot2.png", bg = "white")
plot(feb_hpc$Date,feb_hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
rm(feb_hpc)
}
