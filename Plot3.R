download <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "temp")
unzip("temp")
unlink("temp")


#Reading data
data <- read.table("household_power_consumption.txt", skip=1,sep=";")
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Transforming the Date and Time to respective objects
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# PLotting
plot(subdata$Time,subdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subdata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subdata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
