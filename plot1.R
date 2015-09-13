##L4 Project1 Plot1
##household_pc<-read.table("household_power_consumption.txt")
windows.options(width=480,height=480)
names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
household_pc<-read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),stringsAsFactors=FALSE,head=T,sep=";",col.names=names)
windows.options(width=480,height=480)
hist(household_pc$Global_active_power, col = "red",xlab="Global Active Power(kilowatt)",main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off() 