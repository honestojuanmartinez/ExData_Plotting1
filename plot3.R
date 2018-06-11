setwd("C:/Users/D19902864K/Desktop/Personal/Coursera/Data Science/4. Exploratory Data Analysis/Trabajos/WK1")

d<-read.csv("household_power_consumption.txt", sep=";")
d1<-as.character(d$Date) %in% c("1/2/2007","2/2/2007")
datos<-d[d1,]
rm(d)
rm(d1)

hora<-strptime(paste(datos$Date, datos$Time),"%d/%m/%Y  %H:%M:%S")
valor1<-as.numeric(paste(datos$Sub_metering_1))
valor2<-as.numeric(paste(datos$Sub_metering_2))
valor3<-as.numeric(paste(datos$Sub_metering_3))

png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(hora, valor1, type="l", ylab="Energy sub metering", xlab="")
lines(hora, valor2, type="l", col="red")
lines(hora, valor3, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "blue","red"))
dev.off()
