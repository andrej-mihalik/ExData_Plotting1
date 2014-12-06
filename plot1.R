consumption <- read.csv('household_power_consumption.txt',sep=";",header=TRUE,quote="",na.strings="?")
consumption.subset <- consumption[consumption$Date == '1/2/2007' | consumption$Date == '2/2/2007',] 
consumption.subset$datetime<-strptime(paste(consumption.subset$Date,consumption.subset$Time),'%d/%m/%Y %H:%M:%S')

png('plot1.png',width=480,height=480)
par(mfrow=c(1,1),mar=c(4,4,4,4))
hist(consumption.subset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()