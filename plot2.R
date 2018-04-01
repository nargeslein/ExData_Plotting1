#call the data preparation part
source("dataPreparation.R")

#-----------------------------------------
#create the actual plot
#-----------------------------------------
oldwd <- getwd()
setwd(file.path(oldwd,"figure"))
oldfile <- file.path(getwd(), "plot2.png")
#remove existing file
if(file.exists(oldfile))
  file.remove(oldfile)

png(file="plot2.png")
plot(fdata$DateTime, fdata$Global_active_power, type="l", xlab="",
     ylab="Global Activity Power (kilowatts)")
dev.off()

#change wd back
setwd(oldwd)