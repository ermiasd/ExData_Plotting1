setwd("~/exploringdata/exdata-data-household_power_consumption")

#assumes data has been downloaded and extracted into this directory

# read apporx 3000 lines starting with date 1/2/2007
elecData <- read.table("household_power_consumption.txt", skip =grep("1/2/2007",readLines("household_power_consumption.txt")),nrows=3000, sep = ";")

# subset just the 2 days worth of data, rename columns
numrows <- 2 *24*60
elecData2 <- as.data.frame(elecData[1:numrows-1,])
head(elecData2)
tail(elecData2)
library(dplyr)
elecData2 <- rename(elecData2, Date=V1, Time=V2, Global_active_power=V3, Global_reactive_power=V4, Voltage=V5, Global_intensity=V6, Sub_metering_1=V7, Sub_metering_2=V8, Sub_metering_3=V9)
head(elecData2)

# change column classes
elecData2$Date <- as.Date(elecData2$Date, format="%d/%m/%Y")
weekday <- weekdays(elecData2$Date)
complete_Date <- as.POSIXct(paste(elecData2$Date, elecData2$Time))

electData2$Weekday <- weekday
elecData2$Complete_date <- complete_Date

# plot 1
png(filename = "plot1.png")
par(mfrow = c(1,1))
hist(elecData2$Global_active_power, xlab ="Global Active Power(kilowatts)", ylab= "Frequency", main ="Global Active Power", col = 2)
dev.off()

