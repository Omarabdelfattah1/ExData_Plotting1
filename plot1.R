
household <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";")


household$date =datetime <- paste(household$Date, household$Time)

datetime <- as.Date(strptime(datetime, "%d/%m/%Y %H:%M:%S"))

household <- cbind(datetime, household[,-(1:2)])

household <- subset(household, datetime >= as.Date("2007-02-01") & datetime <= as.Date("2007-02-02"))

household$Global_active_power = as.numeric(as.character(household$Global_active_power))

png("plot1.png", width = 480, height = 480)

hist(household$Global_active_power,main = "Houshold Active Power" ,xlab = "Global Active Power (kilowatts)", col = "Red")

dev.off()