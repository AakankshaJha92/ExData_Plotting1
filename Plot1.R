download <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "temp")
unzip("temp")
unlink("temp")

#Reading data
data <- read.table("household_power_consumption.txt", skip=1,sep=";")
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

#Plotting Histogram
hist(as.numeric(as.character(subdata$Global_active_power)), col="red",
     main="Global Active Power", xlab="Global Active Power(kilowatts)")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
