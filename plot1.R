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

png(filename="plot1.png",height=480,width=480,units="px")

#plot1
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()