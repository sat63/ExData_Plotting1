## Plot 3

## #download and unzip file
## download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
## unzip ("data.zip", exdir = "./")

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

## Create Plot 3

  plot(data1$Sub_metering_1, data1$dateandtime, type ="1", col = "black",
       xlab = "", ylab = "Energy sub metering")
  lines(data1$Sub_metering_2, data1$dateandtime, col = "Red")
  lines(data1$Sub_metering_3, data1$dateandtime, col = "Blue")

legend("topright", col=c("black", "red", "blue"), lty = 1, lwd = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)

## Save file

dev.copy (png, file="plot3.png", height = 480, width = 480)
dev.off()