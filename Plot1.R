#Read Data
powerdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")
#Change Date
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
#Change Time Format
powerdata$Time <- format(powerdata$Time, format="%H:%M:%S")
#Change Data to numeric
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
#Select Date
data <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")
#Create png
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", border="black", main ="Global active power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
