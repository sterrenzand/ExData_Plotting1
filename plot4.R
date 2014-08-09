download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip")
## please unzip the file into your working directory
dt<-read.table("./household_power_consumption/household_power_consumption.txt", sep=";",header=TRUE,na.strings="?") #"?" is interpreted as NAt
dt$Time<- strptime(paste(as.character(dt$Date),as.character(dt$Time)), format="%d/%m/%Y %H:%M:%S")
dt$Date<-as.Date(dt$Date, "%d/%m/%Y")

## limit the data to only data from dates 2007-02-01 or 2007-02-02
dt<-subset(dt,((dt$Date == "2007-02-01") | (dt$Date == "2007-02-02")))

par(mfrow = c(2,2), mar = c(4,4,2,1))

with(dt, {plot(Time, Global_active_power, type="l", ylab="Global Active Power",xlab="")
          plot(Time, Voltage, type="l", ylab="Voltage",xlab="datetime")
          plot(Time, Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
          lines(Time, Sub_metering_2, col="red")
          lines(Time, Sub_metering_3, col="blue")
          legend("topright", lty=1, col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
          plot(Time, Global_reactive_power, type="l", ylab="Global_reactive_power",xlab="datetime")
        })


png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

par(mfrow = c(2,2), mar = c(4,4,2,1))

with(dt, {plot(Time, Global_active_power, type="l", ylab="Global Active Power",xlab="")
          plot(Time, Voltage, type="l", ylab="Voltage",xlab="datetime")
          plot(Time, Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
          lines(Time, Sub_metering_2, col="red")
          lines(Time, Sub_metering_3, col="blue")
          legend("topright", lty=1, col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
          plot(Time, Global_reactive_power, type="l", ylab="Global_reactive_power",xlab="datetime")
})

dev.off() #closes png device