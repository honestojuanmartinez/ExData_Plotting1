#Read data
d<-read.csv("household_power_consumption.txt", sep=";")
d1<-as.character(d$Date) %in% c("1/2/2007","2/2/2007")
datos<-d[d1,]
rm(d)
rm(d1)

#Create plot
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(paste(datos$Global_active_power)), main="Global Active Power", 
     col="red", xlab="Global Active Power (kilowatts)")
dev.off()


