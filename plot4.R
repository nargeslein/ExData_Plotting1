#call the data preparation part
source("dataPreparation.R")

#-----------------------------------------
#create the actual plot
#-----------------------------------------
#change wd in order to create the plots into the figures folder
oldwd <- getwd()
setwd(file.path(oldwd,"figure"))
oldfile <- file.path(getwd(), "plot4.png")
#remove existing file
if(file.exists(oldfile))
  file.remove(oldfile)


#first - top left
png(file="plot4.png")
par(mfrow=c(2,2))
plot(fdata$DateTime, fdata$Global_active_power, type="l", xlab="",ylab="Global Activity Power (kilowatts)")

#second - top right
plot(fdata$DateTime, fdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

#third - bottom left
plot(fdata$DateTime, fdata$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(fdata$DateTime, fdata$Sub_metering_2, col="Red")
lines(fdata$DateTime, fdata$Sub_metering_3, col="Blue")
legend("topright", lty=1, 
       legend =  c("Sub_metering_1","Sub_metering_2","Sub_metering_4"), col=c("Black","Red","Blue"))

#fourth - bottom right
plot(fdata$DateTime, fdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
#change wd back
setwd(oldwd)