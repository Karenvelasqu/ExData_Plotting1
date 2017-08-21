# Read Data
powerdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

#Change Data Class
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")

# Create a new variable Datatime that is the union Data with Time
datetime <- paste(as.Date(powerdata$Date), powerdata$Time)

# to assign the new datatime to powerdata
powerdata$Data_Time<-as.POSIXct(datetime)

#Select time
data1 <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")

#View the variables are correct
head(data1)

#Create plot

png("plot1.png", width=480, height=480)
plot(data1$Global_active_power~data1$Data_Time,type="l",ylab="Global active power (kilowatts",xlab="")
dev.off
