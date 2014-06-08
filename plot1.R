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

## Creating histogram of Global Active Power column and printing it
## on png file named "plot1.png"
png(filename = "plot1.png")
hist(data[,"Global_active_power"], bg = "transparent", col = "red",
     main = "Global Active Power", ylab = "Frequency",
     xlab = "Global Active Power (kilowatts)")
dev.off()