setwd("/Users/GaryLo/Desktop/Exploratory Data Analysis/Course Project 1")
data = read.table("household_power_consumption.txt",header=TRUE,sep=";")

#Formatting data types
data$DateTime = strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date,format="%d/%m/%Y")
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power = as.numeric(as.character(data$Global_reactive_power))
data$Voltage = as.numeric(as.character(data$Voltage))
data$Global_intensity = as.numeric(as.character(data$Global_intensity))
data$Sub_metering_1 = as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 = as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 = as.numeric(as.character(data$Sub_metering_3))

#Subset for 2007-02-01 and 2007-02-01
data = data[data$Date > as.Date("2007-01-31",format="%Y-%m-%d"),]
data = data[data$Date < as.Date("2007-02-03",format="%Y-%m-%d"),]

png(filename="plot4.png",height=480,width=480,units="px")

#plot4
par(mfrow=c(2,2))
#topleft
with(data,plot(DateTime,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))
with(data,lines(DateTime,Global_active_power))
#topright
with(data,plot(DateTime,Voltage,type="n",ylab="Voltage",xlab="datetime",))
with(data,lines(DateTime,Voltage))
#bottomleft
with(data,plot(DateTime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(data,lines(DateTime,Sub_metering_1,col = "black"))
with(data,lines(DateTime,Sub_metering_2,col = "red"))
with(data,lines(DateTime,Sub_metering_3,col = "blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
#bottomright
with(data,plot(DateTime,Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime",))
with(data,lines(DateTime,Global_reactive_power))

dev.off()