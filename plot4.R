## Load the data file
inputfile<-"household_power_consumption.txt"
mydata<-read.csv(inputfile,header = T,sep=";",na.strings="?")

## subsetting on the dates of interest 
mydata<-mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]

## create a Timestamp column from the Date and Time
mydata$Timestamp <-as.POSIXct(strptime(paste(mydata$Date,mydata$Time, sep=" "),format="%e/%m/%Y %H:%M:%S"))

## Open png device; and create 'plot4.png' in my working directory
png(filename = "plot4.png",width = 480, height = 480, units = "px")

## Set the global parameter 
par(bg="transparent",mfrow = c(2, 2))

## Produce the 4 sub-plots
with(mydata, { 
 ## Plot the time evolution of the Global Active Power
     plot(Timestamp,Global_active_power, ylab="Global Active Power",xlab="",type="n")
     with(mydata,lines(Timestamp,Global_active_power))
 ## Plot the time evolution of the Voltage
     plot(Timestamp,Voltage, ylab="Voltage",xlab="datetime",type="n")
     with(mydata,lines(Timestamp,Voltage))
 ## Plot the time evolution of the three Energy sub metering
     plot(Timestamp,Sub_metering_1, ylab="Energy sub metering",xlab="",type="n")
     with(mydata,lines(Timestamp,Sub_metering_1,col="black"))
     with(mydata,lines(Timestamp,Sub_metering_2,col="red"))
     with(mydata,lines(Timestamp,Sub_metering_3,col="blue"))
     legend("topright",lty="solid",bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
 ## Plot the time evolution of the Global Rective Power
     plot(Timestamp,Global_reactive_power,xlab="datetime",type="n")
     with(mydata,lines(Timestamp,Global_reactive_power))     
})

## Close the png file device
dev.off()