## Filename    plot3.R 
## Author      Vasudevan D
## Date        27/Sep/17 
## Purpose     To Create Plots for Exploratory Data analysis Course Project 1 

##Plot 3 Code 

#Reading, naming and subsetting Indivudal household power consumption data
IHEC <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(IHEC) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
ds <- subset(IHEC,IHEC$Date %in% c('1/2/2007', '2/2/2007'))

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")
ds$Time <- strptime(ds$Time, format="%H:%M:%S")
ds[1:1440,"Time"] <- format(ds[1:1440,"Time"],"2007-02-01 %H:%M:%S")
ds[1441:2880,"Time"] <- format(ds[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

## Setting the Graphic Device as File Device 
png(filename = "plot3.png", height = 480, width = 480)

#calling the plot function
plot(ds$Time, ds$Sub_metering_1, type = "n" , ylab = "Energy sub metering", xlab="" )

## annotating the plots 
with(ds, lines(Time, as.numeric(as.character(Sub_metering_1)), col= "black"))
with(ds, lines(Time, as.numeric(as.character(Sub_metering_2)), col= "red"))
with(ds, lines(Time, as.numeric(as.character(Sub_metering_3)), col= "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.55)
title(main = "Energy sub metering Vs Time")

## Closing the graphics device
dev.off()
