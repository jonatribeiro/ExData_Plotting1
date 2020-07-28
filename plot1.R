#Loads libraries

library(dplyr)

#Loads dataset

hpc_data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
                     nrows=2075259, na.strings="?")

#Select subset of dataset

sel_data <- subset(hpc_data, Date %in% c("1/2/2007", "2/2/2007"))

#Plots data

hist(sel_data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", ylab = "Frequency")

#Saves png image

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()