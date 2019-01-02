## Plot 2

## Set working directory

setwd("C:/Users/sanch/Desktop/JHU_DS")

## Access full dataset
rm(list = ls())
data <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?",
                 nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote='\"')

data$Date <- as.Date(data$Date, format= "%d/%m/%Y")

## Data Subset

data1 <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)  ## removes data table "data

## Converting date and time

## dateandtime <- paste(as.Date(data1$Date), data1$Time)
data1$dateandtime <- strptime(paste(data1$Date, data1$Time), "%Y-%m-%d %H:%M:%S")

## Create Plot 2

data1$dateandtime <- as.POSIXct(data1$dateandtime)

attach(data1)
plot(Global_active_power ~ dateandtime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

## Save file

dev.copy(png, file="plot2.png", height = 480, width = 480)
dev.off()