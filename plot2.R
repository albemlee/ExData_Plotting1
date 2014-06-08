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

## Creating scatterplot of Date and Global Active Power and printing it
## on png file named "plot2.png"
png(filename = "plot2.png")
plot(data[,"DateTime"], data[,"Global_active_power"], type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()