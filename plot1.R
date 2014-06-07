# PLOT1.R
# by Ranko Gacesa
# for Coursera course: exploratory data analysis
# date: 6.7.2014

# READ DATA
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
# take care of date format
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

# extract part we are interested in
data2 <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
# convert to numberc
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
# make plot
# set parameters
par(mfcol=c(1,1))
par(cex=1.0)
# make histogram
hist(data2$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
# save to png
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()