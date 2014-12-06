consumption <- read.csv('household_power_consumption.txt',sep=";",header=TRUE,quote="",na.strings="?")
consumption.subset <- consumption[consumption$Date == '1/2/2007' | consumption$Date == '2/2/2007',] 
consumption.subset$datetime<-strptime(paste(consumption.subset$Date,consumption.subset$Time),'%d/%m/%Y %H:%M:%S')

png('plot3.png',width=480,height=480)
plot(consumption.subset$datetime, consumption.subset$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(consumption.subset$datetime, consumption.subset$Sub_metering_2,type="l",col="red")
lines(consumption.subset$datetime, consumption.subset$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'),lty=1)
dev.off()