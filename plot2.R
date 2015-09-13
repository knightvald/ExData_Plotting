##L4 Project1 Plot2

names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
household_pc<-read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),stringsAsFactors=FALSE,head=T,sep=";",col.names=names)
datetime<- paste(household_pc$Date,household_pc$Time)
datetime<-strptime(datetime, "%d/%m/%Y %H:%M:%S")
household_pc<-cbind(datetime,household_pc[,c(-1,-2)])
windows.options(width=480,height=480)
plot(household_pc$Global_active_power~household_pc$datetime,type="l",ylab="Global Active Power(kilowatt)",,xlab ="")
dev.copy(png, file = "plot2.png")
dev.off()