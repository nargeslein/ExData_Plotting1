#-----------------------------------------
#-----------------------------------------
#First part creates the data to be plotted
#-----------------------------------------
if(!exists("fdata")) {
  #download file and unzip
  fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  zipfile <-"zipfile.zip"
  txtfile <- "household_power_consumption.txt"
  
  if(!file.exists(zipfile))
    download.file(fileURL, destfile = file.path(getwd(),zipfile), method="curl")
  
  #read file
  if(!file.exists(txtfile))
    unzip(zipfile=zipfile, exdir=getwd())
  data <- read.table("household_power_consumption.txt",header=TRUE, sep = ";", stringsAsFactors = FALSE)
  
  #filter data in order to only include data from the dates 2007-02-01 and 2007-02-02
  #the date needs to be converted first
  data$Date <-as.Date(as.character(data$Date), format="%d/%m/%Y")
  fdata <- subset(data,
                  data$Date==as.Date("1/2/2007", format="%d/%m/%Y") |
                    data$Date==as.Date("2/2/2007", format="%d/%m/%Y")
  )

  #convert global activity power and submetering to numeric
  fdata$Global_active_power <- as.numeric(fdata$Global_active_power)
  fdata$Sub_metering_1 <- as.numeric(fdata$Sub_metering_1)
  fdata$Sub_metering_2 <- as.numeric(fdata$Sub_metering_2)
  fdata$Sub_metering_3 <- as.numeric(fdata$Sub_metering_3)
  fdata$Voltage <- as.numeric(fdata$Voltage)
  #create a datetime variable containing both date and time
  fdata$DateTime <- strptime(paste(fdata$Date, fdata$Time), format="%Y-%m-%d %H:%M:%S")
}