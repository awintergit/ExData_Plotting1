library(dplyr)
setwd("/Users/adamwinter/R_Analytics/data")
MyData <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
data <- filter(MyData,Date == "1/2/2007"|Date == "2/2/2007")

GapCol <- as.numeric(as.character(data$Global_active_power))
png(filename = "plot1.png",
    width = 480, height = 480)
hist(GapCol,col="red",
     xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()