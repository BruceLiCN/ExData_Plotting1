## read the data
data<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,colClasses = c( "character", "character", rep("numeric", 7)),na.strings ="?",stringsAsFactors=FALSE )
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

## create a new variable, which show the time of each observation in POSIXlt class
f<-function(x){strptime(x,"%d/%m/%Y  %H:%M:%S")}
newtstr <- mapply(paste,data[,1],data[,2], USE.NAMES = FALSE)
data$newt<-f(newtstr)

## we will construct four plots, two plots per row
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)  ) 

## construct the first plot
plot(data[,10],data[,3],col=0, xlab='', ylab='Global Active Power (kilowatts)')
v=1:2879
for(i in v){ lines(c(data$newt[i],data$newt[i+1]),c(data[i,3],data[i+1,3]))   }

## construct the second plot
plot(data[,10],data[,5],col=0, xlab='datetime',  ylab='Voltage')
v=1:2879
for(i in v){ lines(c(data$newt[i],data$newt[i+1]),c(data[i,5],data[i+1,5]))   }

## construct the third plot
plot(data[,10],data[,7],col=0, xlab='',  ylab='Energy sub metering')
v=1:2879
for(i in v){ lines(c(data$newt[i],data$newt[i+1]),c(data[i,7],data[i+1,7]))   }
for(i in v){ lines(c(data$newt[i],data$newt[i+1]),c(data[i,8],data[i+1,8]),col='red')   }
for(i in v){ lines(c(data$newt[i],data$newt[i+1]),c(data[i,9],data[i+1,9]),col='blue'   )   }
legend('topright', pch='——————', col=c('black','red','blue'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), bty='n'   )

## construct the fourth plot
plot(data[,10],data[,4],col=0, xlab='datetime',  ylab='Global_reactive_power')
v=1:2879
for(i in v){ lines(c(data$newt[i],data$newt[i+1]),c(data[i,4],data[i+1,4]))   }

## save the plots into a PNG file
dev.copy(png, file="plot4.png", height = 480, width = 480)
dev.off()
