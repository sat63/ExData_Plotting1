## Plot 1

## Set working directory

setwd("C:/Users/sanch/Desktop/JHU_DS")

## Access full dataset

data <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?",
                 nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote='\"')
data$Date <- as.Date(data$Date, format= "%d/%m/%Y")

## Data Subset

data1 <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)  ## removes data table "data

## Converting dates

dateandtime <- paste(as.Date(data1$Date), data1$Time)
data1$dateandtime <- as.POSIXct(dateandtime)

## Create Plot 1

hist(data1$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

