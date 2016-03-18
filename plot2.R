## read the data
data<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,colClasses = c( "character", "character", rep("numeric", 7)),na.strings ="?",stringsAsFactors=FALSE )
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

## create a new varible which shows time of each observation in POSIXlt class.
f<-function(x){strptime(x,"%d/%m/%Y  %H:%M:%S")}
newtstr <- mapply(paste,data[,1],data[,2], USE.NAMES = FALSE)
data$newt<-f(newtstr)

## construct the plot. The points have no color.  Then, add lines and link the points in time order.   
plot(data[,10],data[,3],col=0, xlab='', ylab='Global Active Power (kilowatts)')
v=1:2879
for(i in v){ lines(c(data$newt[i],data$newt[i+1]),c(data[i,3],data[i+1,3]))   }

## save the plot in to a png file
dev.copy(png, file="plot2.png", height = 480, width = 480)
dev.off()
