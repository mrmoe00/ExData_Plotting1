plot2 <- function() {
  
  #Read the data
  data <- read.table ("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "NA")
  
  #Format and parse Date and Time to readable formats
  data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))
  data$Time <- strptime(paste(data$Date, data$Time), format ="%Y-%m-%d %H:%M:%S")
  
  #Filter by data on needed dates only
  data <- data[data$Date == as.Date("2007-02-02") | data$Date ==as.Date("2007-02-01"),]
  
  
  #Plotting plot2
  plot(data$Time, as.numeric(data$Global_active_power), type="n", ylab = "Global Active Power (kilowatts)", xlab = "", main = "Global Active Power" )
  lines(data$Time, as.numeric(data$Global_active_power), col = "black")
  dev.copy(png, file = "plot2.png", width = 480, height = 480)
  dev.off()
  
}