#call the data preparation part
source("dataPreparation.R")

#-----------------------------------------
#create the actual plot
#-----------------------------------------
#change wd in order to create the plots into the figures folder
oldwd <- getwd()
setwd(file.path(oldwd,"figure"))
oldfile <- file.path(getwd(), "plot1.png")
#remove existing file
if(file.exists(oldfile))
  file.remove(oldfile)

png(file="plot1.png")
hist(fdata$Global_active_power, col="Red", xlab="Global Activity Power (kilowatts)", main="Global Activity Power")
dev.off()

#change wd back
setwd(oldwd)