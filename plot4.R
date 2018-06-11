#Read data
d<-read.csv("household_power_consumption.txt", sep=";")
d1<-as.character(d$Date) %in% c("1/2/2007","2/2/2007")
datos<-d[d1,]
rm(d)
rm(d1)

#Prepare plot values
hora<-strptime(paste(datos$Date, datos$Time),"%d/%m/%Y  %H:%M:%S")
valor<-as.numeric(paste(datos$Global_active_power))
valor1<-as.numeric(paste(datos$Sub_metering_1))
valor2<-as.numeric(paste(datos$Sub_metering_2))
valor3<-as.numeric(paste(datos$Sub_metering_3))
valor4<-as.numeric(paste(datos$Voltage))
valor5<-as.numeric(paste(datos$Global_reactive_power))

#Create plot
png(filename = "plot4.png", width = 480, height = 480, units = "px")
  par(mfrow = c(2, 2))
  plot(hora, valor, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(hora, valor4, type="l", ylab="Voltage", xlab="datetime")
  plot(hora, valor1, type="l", ylab="Energy sub metering", xlab="")
  lines(hora, valor2, type="l", col="red")
  lines(hora, valor5, type="l", col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1,1), col=c("black", "blue","red"), bty="n")
  plot(hora, datos$Global_reactive_power, type="l", xlab="datetime")  
dev.off()

