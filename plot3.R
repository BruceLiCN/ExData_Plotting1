## read the data
data<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,colClasses = c( "character", "character", rep("numeric", 7)),na.strings ="?",stringsAsFactors=FALSE )
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

## create a new variable, which shows the time of each observation in POSIXlt class
f<-function(x){strptime(x,"%d/%m/%Y  %H:%M:%S")}
newtstr <- mapply(paste,data[,1],data[,2], USE.NAMES = FALSE)
data$newt<-f(newtstr)

## construct the plots in different colors  
plot(data[,10],data[,7],col=0, xlab='',  ylab='Energy sub metering')
v=1:2879
for(i in v){ lines(c(data$newt[i],data$newt[i+1]),c(data[i,7],data[i+1,7]))   }
for(i in v){ lines(c(data$newt[i],data$newt[i+1]),c(data[i,8],data[i+1,8]),col='red')   }
for(i in v){ lines(c(data$newt[i],data$newt[i+1]),c(data[i,9],data[i+1,9]),col='blue'   )   }

## add the legend
legend('topright', pch='——————', col=c('black','red','blue'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3') , cex=0.75 )

##save the plot into a PNG file
dev.copy(png, file="plot3.png", height = 480, width = 480)
dev.off()
