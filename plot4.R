#Loads libraries

library(dplyr)

#Changes weekdays to English

Sys.setlocale("LC_TIME", "English")

#Loads dataset

hpc_data <- read.csv("household_power_consumption.txt", header=TRUE, 
                     sep=";", nrows=2075259, na.strings="?")

#Selects subset of dataset and establishes Date variable

sel_data <- subset(hpc_data, Date %in% c("1/2/2007", "2/2/2007"))
sel_data$Date <- as.Date(sel_data$Date, format="%d/%m/%Y")

#Establishes datetime variable

datetime <- paste(sel_data$Date, sel_data$Time)
sel_data$Datetime <- as.POSIXct(datetime)

#Plots image grid

par(mfrow=c(2,2), mar=c(4,4,2,1))
with(sel_data, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage", xlab="")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1,
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global_reactive_power",xlab="")
})

#Saves png image

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()