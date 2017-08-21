# Read Data
powerdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

#Change Data Class
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")

# Create a new variable Datatime that is the union Data with Time
datetime <- paste(as.Date(powerdata$Date), powerdata$Time)

# to assign the new datatime to powerdata
powerdata$Data_Time<-as.POSIXct(datetime)

#Select time
data2 <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")

#View the variables are correct
head(data2)

#Create the plot

png("plot3.png", width=480, height=480)
with(data2,plot(data2$Data_Time,data2$Sub_metering_1,type="l",xlab = "Day",ylab = "Energy sub metering"))
lines(data2$Data_Time,data2$Sub_metering_2,type="l",col="red")
lines(data2$Data_Time,data2$Sub_metering_3,type="l",col="blue")
legend(c("topright"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty= 1, lwd=2, col=c("black","red","blue"))
dev.off()
