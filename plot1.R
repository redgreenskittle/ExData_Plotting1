#reading table and subsetting data for dates of interest
power<- read.table ("household_power_consumption.txt", skip = 1, sep=";")
names(power)<- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
powersub<- subset(power, power$date=="1/2/2007" | power$date=="2/2/2007")
#calling plot function
hist(as.numeric(powersub$global_active_power), freq = TRUE, col = "red", main = "Global Active Power", xlab = "Global Ative Power (kilowatts)")