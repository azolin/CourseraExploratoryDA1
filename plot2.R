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
# plot 
plot(y=data2$Global_active_power,x=data2$ftime,type="s",main="",xlab="",ylab="Global Active Power (kilowatts)")
# save to png
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()