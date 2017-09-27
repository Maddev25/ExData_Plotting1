## Filename    plot1.R 
## Author      Vasudevan D
## Date        27/Sep/17 
## Purpose     To Create Plots for Exploratory Data analysis Course Project 1 

##Plot 1 Code 

#Reading, naming and subsetting Indivudal household power consumption data
IHEC <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(IHEC) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
ds <- subset(IHEC,IHEC$Date %in% c('1/2/2007', '2/2/2007'))

## Setting the Graphic Device as File Device 
png(filename = "plot1.png", height = 480, width = 480)

#calling the histogram plot function
hist(as.numeric(as.character(ds$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

## annotating the plot 
title(main = "Global Active Power")

## Closing the graphics device
dev.off()
