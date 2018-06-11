#Read data
d<-read.csv("household_power_consumption.txt", sep=";")
d1<-as.character(d$Date) %in% c("1/2/2007","2/2/2007")
datos<-d[d1,]
rm(d)
rm(d1)

#Prepare plot values
hora<-strptime(paste(datos$Date, datos$Time),"%d/%m/%Y  %H:%M:%S")
valor<-as.numeric(paste(datos$Global_active_power))

#Create plot
png(filename = "plot2.png", width = 480, height = 480, units = "px")
  plot(hora, valor, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
