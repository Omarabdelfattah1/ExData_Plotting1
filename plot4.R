fileName <- "household_power_consumption.txt"


colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c("character", "character", rep("numeric",7) )


readFile <- read.table(fileName, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")


readFile$date = as.Date(readFile$date, format="%d/%m/%Y")
readFile = readFile[readFile$date >= as.Date("2007-02-01") & readFile$date<=as.Date("2007-02-02"),]

png(filename="plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

#1st 
plot(readFile$globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power")
axis(1, at=c(1, as.integer(nrow(readFile)/2), nrow(readFile)), labels=c("Thu", "Fri", "Sat"))


plot(readFile$voltage, type="l",xaxt="n",xlab="datetime", ylab="Voltage")
axis(1, at=c(1, as.integer(nrow(readFile)/2), nrow(readFile)), labels=c("Thu", "Fri", "Sat"))


with(readFile, {
  plot(subMetering1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
  lines(x=subMetering2, col="red")
  lines(x=subMetering3, col="blue")
})

axis(1, at=c(1, as.integer(nrow(readFile)/2), nrow(readFile)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0,box.col = "transparent", bg="transparent")


plot(readFile$globalReactivePower, type="l",xaxt="n",xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(1, as.integer(nrow(readFile)/2), nrow(readFile)), labels=c("Thu", "Fri", "Sat"))

dev.off()
