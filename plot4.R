##L4 Project1 Plot4

par(mfrow = c(2, 2), mar = c(4, 4, 1, 1), oma = c(0, 0, 2, 0))
names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
household_pc<-read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),stringsAsFactors=FALSE,head=T,sep=";",col.names=names)
windows.options(width=480,height=480)
##----------------------------------------------
##plot1
hist(household_pc$Global_active_power, col = "red",xlab="Global Active Power(kilowatt)",main="Global Active Power")
##-----------------------------------------------
##plot2
datetime<- paste(household_pc$Date,household_pc$Time)
datetime<-strptime(datetime, "%d/%m/%Y %H:%M:%S")
household_pc<-cbind(datetime,household_pc[,c(-1,-2)])
with(household_pc,plot(Voltage~datetime,type="l",xlab="datetime",ylab="Voltage"))
##-----------------------------------------------
##plot3
with(household_pc,{plot(Sub_metering_1~datetime,type="l")
                   lines(Sub_metering_2~datetime,type="l",col="red")
                   lines(Sub_metering_3~datetime,type="l",xlab="",ylab="",col="blue",)})
legend("topright",col = c("black", "red", "blue"),lty=1,lwd=1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5,xjust=0,bty="n")

##------------------------------------------------
##plot4
with(household_pc,plot(Global_reactive_power~datetime,type="l",xlab="datetime",ylab="Global_reactive_power"))
dev.copy(png, file = "plot4.png")
dev.off()
