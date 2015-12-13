library(dplyr)
setwd("/Users/adamwinter/R_Analytics/data")
MyData <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
data <- filter(MyData,Date == "1/2/2007"|Date == "2/2/2007")

DTboth <- strptime(paste(data$Date,data$Time,sep=" "),format ="%d/%m/%Y %H:%M:%S")
png("plot2.png",width=480,height=480)
plot(DTboth, GapCol, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()