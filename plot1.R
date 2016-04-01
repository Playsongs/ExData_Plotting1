## plot1.R
## Reads household power consumption and selects data for dates (2002/02/01 and 2007/02/02)
## Prints a histogram to plot1.png of the frequency of global active power
## Data is checked and coerced for date and numeric
library(lubridate)
{
hpc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
## Selects on the data from date "2007-02-01" and "2007-02-02"
if (!is.Date(hpc$Date))
  hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")
feb_hpc <- subset(hpc, Date=="2007-02-01"|Date=="2007-02-02")
rm(hpc)
## Ensures that Global_active_power is numeric before plotting the data
if (!is.numeric(feb_hpc$Global_active_power))
  feb_hpc$Global_active_power <- as.numeric(feb_hpc$Global_active_power)
## Histogram plot sent to plot1.png
png(file = "plot1.png", bg = "white")
hist(feb_hpc$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
rm(feb_hpc)
}