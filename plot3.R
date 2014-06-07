# PLOT2.R
# by Ranko Gacesa
# for Coursera course: exploratory data analysis
# date: 6.7.2014
#  - NOTE: household_power_consumption.txt has to be in this folder, NOT included in github
#          due to file size

# READ DATA
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
# take care of date format
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

# extract part we are interested in
data2 <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
# handle times
data2$ftime <- as.POSIXlt(paste(data2$Date,data2$Time))
# convert to numberc
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
# make plot
par(mfcol=c(1,1))
par(cex=1.0)
# -> first stepwise (Sub_1)
plot(y=as.numeric(as.character(data2$Sub_metering_1)),x=data2$ftime,type="s",main="",xlab="",ylab="Energy sub metering",yaxt='n',lwd=0.5)
# -> 2nd
points(y=as.numeric(as.character(data2$Sub_metering_2)),x=data2$ftime,type="s",col="red",lwd=0.5)
# -> 3d
points(y=as.numeric(as.character(data2$Sub_metering_3)),x=data2$ftime,type="s",col="blue",lwd=0.5)
# legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
lty=c(1,1,1), 
lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
# axis
axis(2,at=c(0,10,20,30))
# save to png
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()