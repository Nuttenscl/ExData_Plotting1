## Load the data file
inputfile<-"household_power_consumption.txt"
mydata<-read.csv(inputfile,header = T,sep=";",na.strings="?")

## subsetting on the dates of interest 
mydata<-mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]

## create a Timestamp column from the Date and Time
mydata$Timestamp <-as.POSIXct(strptime(paste(mydata$Date,mydata$Time, sep=" "),format="%e/%m/%Y %H:%M:%S"))

## Open png device; and create 'plot2.png' in my working directory
png(filename = "plot2.png",width = 480, height = 480, units = "px")

## Set the global parameter 
par(bg="transparent")

## Plot the time evolution of the Global Active Power
with(mydata, plot(Timestamp,Global_active_power, ylab="Global Active Power (kilowatts)",xlab="",type="n"))
with(mydata,lines(Timestamp,Global_active_power))

## Close the png file device
dev.off()