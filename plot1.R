## Load the data file
inputfile<-"household_power_consumption.txt"
mydata<-read.csv(inputfile,header = T,sep=";",na.strings="?")

## subsetting on the dates of interest 
mydata<-mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]

## create a Timestamp column from the Date and Time
mydata$Timestamp <-as.POSIXct(strptime(paste(mydata$Date,mydata$Time, sep=" "),format="%e/%m/%Y %H:%M:%S"))

## Open png device; and create 'plot1.png' in my working directory
png(filename = "plot1.png",width = 480, height = 480, units = "px")

## Set the global parameter 
par(bg="transparent")

## Plot the histogram of the Global Active Power
with(mydata, hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))

## Close the png file device
dev.off() 