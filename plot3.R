#call the data preparation part
source("dataPreparation.R")

#-----------------------------------------
#create the actual plot
#-----------------------------------------
#change wd in order to create the plots into the figures folder
oldwd <- getwd()
setwd(file.path(oldwd,"figure"))
oldfile <- file.path(getwd(), "plot3.png")
#remove existing file
if(file.exists(oldfile))
  file.remove(oldfile)

png(file="plot3.png")
plot(fdata$DateTime, fdata$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(fdata$DateTime, fdata$Sub_metering_2, col="Red")
lines(fdata$DateTime, fdata$Sub_metering_3, col="Blue")
legend("topright", lty=1, legend =  c("Sub_metering_1","Sub_metering_2","Sub_metering_4"), col=c("Black","Red","Blue"))
dev.off()

#change wd back
setwd(oldwd)