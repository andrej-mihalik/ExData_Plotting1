consumption <- read.csv('household_power_consumption.txt',sep=";",header=TRUE,quote="",na.strings="?")
consumption.subset <- consumption[consumption$Date == '1/2/2007' | consumption$Date == '2/2/2007',] 
consumption.subset$datetime<-strptime(paste(consumption.subset$Date,consumption.subset$Time),'%d/%m/%Y %H:%M:%S')

png('plot4.png',width=480,height=480)
par(mfrow=c(2,2),mar=c(4,4,4,2))

plot(consumption.subset$datetime,consumption.subset$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(consumption.subset$datetime,consumption.subset$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(consumption.subset$datetime, consumption.subset$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(consumption.subset$datetime, consumption.subset$Sub_metering_2,type="l",col="red")
lines(consumption.subset$datetime, consumption.subset$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'),lty=1,bty="n")

plot(consumption.subset$datetime,consumption.subset$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
