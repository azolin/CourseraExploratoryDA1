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
# convert to number
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

# prepare for multiple plots
# set parameters
par(mfcol=c(2,2))
par(cex=0.6)
# ---- make plot 1 ---
plot(y=data2$Global_active_power,x=data2$ftime,type="s",main="",xlab="",ylab="Global Active Power")

# ---- plot 2 ---
# -> first stepwise (Sub_1)
plot(y=as.numeric(as.character(data2$Sub_metering_1)),x=data2$ftime,type="s",main="",xlab="",ylab="Energy sub metering",yaxt='n',lwd=0.5)
# -> 2nd
points(y=as.numeric(as.character(data2$Sub_metering_2)),x=data2$ftime,type="s",col="red",lwd=0.5)
# -> 3d
points(y=as.numeric(as.character(data2$Sub_metering_3)),x=data2$ftime,type="s",col="blue",lwd=0.5)
# legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), 
       lwd=c(1,1,1),col=c("black","red","blue"),
       bty = "n"
       )
# axis
axis(2,at=c(0,10,20,30))
# ---- plot 3 ---
plot(y=as.numeric(as.character(data2$Voltage)),x=data2$ftime,type="s",main="",xlab="datatime",ylab="Voltage")
# ---- plot 4 ---
plot(y=as.numeric(as.character(data2$Global_reactive_power)),x=data2$ftime,type="s",main="",xlab="datatime",ylab="Global_reactive_power")
# save to png
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()

