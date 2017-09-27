## Filename    plot4.R 
## Author      Vasudevan D
## Date        27/Sep/17 
## Purpose     To Create Plots for Exploratory Data analysis Course Project 1 

##Plot 4 Code 

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
png(filename = "plot4.png", height = 480, width = 480)

## initiating the Multi - Plot 
par(mfrow=c(2,2))

#calling the plot function that builds 4 plots in the Graph
with(ds,{
  plot(ds$Time,as.numeric(as.character(ds$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(ds$Time,as.numeric(as.character(ds$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(ds$Time,ds$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(ds,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(ds,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(ds,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.10)
  plot(ds$Time,as.numeric(as.character(ds$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})



## Closing the graphics device
dev.off()
