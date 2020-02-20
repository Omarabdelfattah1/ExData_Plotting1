
fileName <- "household_power_consumption.txt"


readFile <- read.table(fileName, header=TRUE, sep=";", na.strings="?")

readFile$date = as.Date(readFile$date, format="%d/%m/%Y")
readFile = readFile[readFile$date >= as.Date("2007-02-01") & readFile$date<=as.Date("2007-02-02"),]

png(filename="plot2.png", width=480, height=480, units="px")

plot(df$globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(df)/2), nrow(df)), labels=c("Thu", "Fri", "Sat"))

dev.off()