library(dplyr)
setwd("/Users/adamwinter/R_Analytics/data")
MyData <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
data <- filter(MyData,Date == "1/2/2007"|Date == "2/2/2007")


DTboth <- strptime(paste(data$Date,data$Time,sep=" "),format ="%d/%m/%Y %H:%M:%S")
GapCol <- as.numeric(as.character(data$Global_active_power))
volt <- as.numeric(as.character(data$Voltage))
subM1 <- as.numeric(as.character(data$Sub_metering_1))
subM2 <- as.numeric(as.character(data$Sub_metering_2))
subM3 <- as.numeric(as.character(data$Sub_metering_3))
GrpCol <- as.numeric(as.character(data$Global_reactive_power))


png("plot4.png",width=480,height=480)
par(mfrow = c(2,2))

plot(DTboth, GapCol, type="l", xlab="", ylab="Global Active Power")
plot(DTboth,volt, type="l",xlab="datetime",ylab="Voltage")
plot(DTboth, subM1, type="l", xlab="", ylab="Energy sub metering",col="black")
lines(DTboth, subM2, type="l", xlab="", ylab="Energy sub metering",col="red")
lines(DTboth, subM3, type="l", xlab="", ylab="Energy sub metering",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),bty="n",lty=1,lwd=2.5)
plot(DTboth,GrpCol, type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
