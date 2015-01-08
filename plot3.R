## Load the data file
inputfile<-"household_power_consumption.txt"
mydata<-read.csv(inputfile,header = T,sep=";",na.strings="?")

## subsetting on the dates of interest 
mydata<-mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]

## create a Timestamp column from the Date and Time
mydata$Timestamp <-as.POSIXct(strptime(paste(mydata$Date,mydata$Time, sep=" "),format="%e/%m/%Y %H:%M:%S"))

## Open png device; and create 'plot3.png' in my working directory
png(filename = "plot3.png",width = 480, height = 480, units = "px")

## Set the global parameter 
par(bg="transparent")

## Plot the time evolution of the three Energy sub metering
with(mydata, plot(Timestamp,Sub_metering_1, ylab="Energy sub metering",xlab="",type="n"))
with(mydata,lines(Timestamp,Sub_metering_1,col="black"))
with(mydata,lines(Timestamp,Sub_metering_2,col="red"))
with(mydata,lines(Timestamp,Sub_metering_3,col="blue"))

# Add the legend
legend("topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Close the png file device
dev.off() 