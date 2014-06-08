## Calculating memory required and loading the Data
MemoryRequired <- object.size("household_power_consumption.txt")
data <- read.table("household_power_consumption.txt", header = TRUE,
                   sep = ";", na.strings = "?")

# Subset data to only include needed dates
data <- data[xor(data[,"Date"] == "1/2/2007",
                 data[,"Date"] == "2/2/2007"),]

## Convert Date and Time columns to correct types
DateTime <- strptime(paste(data[,"Date"], data[,"Time"], sep = " "),
                     format = "%d/%m/%Y %H:%M:%S")
data <- cbind(DateTime, data)

## Creating 4 different scatter plots (Global Active Power, Voltage,
## Energy Sub Metering, Global Reactive Power) and printing it on png
## file named "plot4.png"
png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(data[,"DateTime"], data[,"Global_active_power"], type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
plot(data[,"DateTime"], data[,"Voltage"], type = "l",
     ylab = "Voltage", xlab = "datetime")
plot(data[,"DateTime"], data[,"Sub_metering_1"], type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(data[,"DateTime"], data[,"Sub_metering_2"], type = "l", col = "red")
lines(data[,"DateTime"], data[,"Sub_metering_3"], type = "l", col = "blue")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),
       col=c("black","red","blue"), lty = 1)
plot(data[,"DateTime"], data[,"Global_reactive_power"], type = "l",
     ylab = "Global_reactive_power", xlab = "datetime")
dev.off()