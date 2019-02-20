#reading table and subsetting data for dates of interest
power<- read.table ("household_power_consumption.txt", skip = 1, sep=";")
names(power)<- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
powersub<- subset(power, power$date=="1/2/2007" | power$date=="2/2/2007")

#converting date and time variable to date/time classes
powersub$date<- as.Date(powersub$date, format= "%d/%m/%Y")
powersub$time<- strptime(powersub$time, format = "%H:%M:%S")
powersub [1:1440, "time"] <- format(powersub[1:1440, "time"], "2007-02-01 %H:%M:%S")
powersub [1441:2880, "time"] <- format(powersub[1441:2880, "time"], "2007-02-02 %H:%M:%S")
#plot

par(mfrow= c(2,2))

plot(powersub$time, as.numeric(as.character(powersub$global_active_power)), type= "l", xlab="", ylab= "Global Active Power")

plot(powersub$time, as.numeric(as.character(powersub$voltage)), type = "l", xlab = "datetime", ylab = "Voltage")

plot(powersub$time, powersub$sub_metering_1, type = "n", xlab = "", ylab= "Energy sub metering")
with(powersub, lines(time, as.numeric(as.character(powersub$sub_metering_1))))
with(powersub, lines(time, as.numeric(as.character(powersub$sub_metering_2)), col="red"))
with(powersub, lines(time, as.numeric(as.character(powersub$sub_metering_3)), col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "sub_metering_2", "sub_metering_3"), cex = 0.4)

plot(powersub$time, as.numeric(as.character(powersub$global_reactive_power)), type= "l", xlab="date time", ylab= "Global_reactive_power")
