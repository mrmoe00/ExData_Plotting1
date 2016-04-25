plot1 <- function() {
  
  #Read the data
  data <- read.table ("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "NA")
  
  #Format and parse Date and Time to readable formats
  data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))
  data$Time <- strptime(paste(data$Date, data$Time), format ="%Y-%m-%d %H:%M:%S")
  
  #Filter by data on needed dates only
  data <- data[data$Date == as.Date("2007-02-02") | data$Date ==as.Date("2007-02-01"),]
  
  
#Plotting plot1
hist(as.numeric(data$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()


}