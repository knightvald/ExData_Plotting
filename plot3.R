##L4 Project1 Plot3
names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
household_pc<-read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),stringsAsFactors=FALSE,head=T,sep=";",col.names=names)
datetime<- paste(household_pc$Date,household_pc$Time)
datetime<-strptime(datetime, "%d/%m/%Y %H:%M:%S")
household_pc<-cbind(datetime,household_pc[,c(-1,-2)])

windows.options(width=480,height=480)
with(household_pc,plot(Sub_metering_1~datetime,type="l",xlab="",ylab="Energy sub metering"),legend=T)
with(household_pc,lines(Sub_metering_2~datetime,type="l",xlab="",ylab="",col="red"))
with(household_pc,lines(Sub_metering_3~datetime,type="l",xlab="",ylab="",col="blue",))
legend("topright",col = c("black", "red", "blue"),lty=1,lwd=1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7,xjust=0.5)
dev.copy(png, file = "plot3.png")
dev.off()