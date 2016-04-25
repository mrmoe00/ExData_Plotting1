plot4 <- function() {
  
  #Read the data
  data <- read.table ("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "NA")
  
  #Format and parse Date and Time to readable formats
  data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))
  data$Time <- strptime(paste(data$Date, data$Time), format ="%Y-%m-%d %H:%M:%S")
  
  #Filter by data on needed dates only
  data <- data[data$Date == as.Date("2007-02-02") | data$Date ==as.Date("2007-02-01"),]
  
  #Plotting plot4
  par( mfrow = c(2,2))
  
  plot(data$Time, as.numeric(data$Global_active_power), type="n", ylab = "Global Active Power", xlab = "")
  lines(data$Time, as.numeric(data$Global_active_power), col = "black")
  
  plot(data$Time, as.numeric(data$Voltage), type="n", ylab = "Voltage", xlab = "datetime")
  lines(data$Time, as.numeric(data$Voltage), col = "black")
  
  plot(data$Time, data$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab ="")
  lines(data$Time, data$Sub_metering_1, col = "gray")
  lines(data$Time, data$Sub_metering_2, col = "red")
  lines(data$Time, data$Sub_metering_3, col = "blue")
  
  plot(data$Time, as.numeric(data$Global_reactive_power), type="n", ylab = "Global_reactive_power", xlab = "datetime")
  lines(data$Time, as.numeric(data$Global_reactive_power), col = "black")
  
  dev.copy(png, file = "plot4.png", width = 480, height = 480)
  dev.off()
  
}