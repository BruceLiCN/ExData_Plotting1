## read the data
data<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,colClasses = c( "character", "character", rep("numeric", 7)),na.strings ="?",stringsAsFactors=FALSE )
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

##  construct a plot and adjust its color, title and labs. 
hist(data[,3], col='red',main='Global Active Power', xlab='Global Active Power (kilowatts)',las=0)

## save the plot into a PNG file
dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off()
