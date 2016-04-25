plot3 <- function() {
  
  #Read the data
  data <- read.table ("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "NA")
  
  #Format and parse Date and Time to readable formats
  data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))
  data$Time <- strptime(paste(data$Date, data$Time), format ="%Y-%m-%d %H:%M:%S")
  
  #Filter by data on needed dates only
  data <- data[data$Date == as.Date("2007-02-02") | data$Date ==as.Date("2007-02-01"),]
  
  #Plotting plot3
  plot(data$Time, data$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab ="")
  lines(data$Time, data$Sub_metering_1, col = "gray")
  lines(data$Time, data$Sub_metering_2, col = "red")
  lines(data$Time, data$Sub_metering_3, col = "blue")
  dev.copy(png, file = "plot3.png", width = 480, height = 480)
  dev.off()
  
}