library(dplyr)
setwd("/Users/adamwinter/R_Analytics/data")
MyData <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
data <- filter(MyData,Date == "1/2/2007"|Date == "2/2/2007")

subM1 <- as.numeric(as.character(data$Sub_metering_1))
subM2 <- as.numeric(as.character(data$Sub_metering_2))
subM3 <- as.numeric(as.character(data$Sub_metering_3))

png("plot3.png",width=480,height=480)
plot(DTboth, subM1, type="l", xlab="", ylab="Energy sub metering",col="black")
lines(DTboth, subM2, type="l", xlab="", ylab="Energy sub metering",col="red")
lines(DTboth, subM3, type="l", xlab="", ylab="Energy sub metering",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,lwd=2.5)
dev.off()

