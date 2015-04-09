fn <- "household_power_consumption.txt"
dat <- read.csv2( fn, skip=grep("1/2/2007", readLines(fn) )-1,nrows=60*24*2, header = FALSE, na.strings = c("?"), comment.char='', colClasses = "character")

dates <- strptime(paste(dat[,1],dat[,2]), "%d/%m/%Y %H:%M:%S" )
dat[,3] <- as.numeric(dat[,3])
dat[,7] <- as.numeric(dat[,7])
dat[,8] <- as.numeric(dat[,8])
dat[,9] <- as.numeric(dat[,9])

plot(dates,dat$V7, type = "n", xlab ="", ylab = "")
lines(dates,dat$V7)
lines(dates,dat$V8, col = "red")
lines(dates,dat$V9, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1)
title( ylab = "Energy sub metering")

png("plot3.png", width = 480, height = 480 )
plot(dates,dat$V7, type = "n", xlab ="", ylab = "")
lines(dates,dat$V7)
lines(dates,dat$V8, col = "red")
lines(dates,dat$V9, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1)
title( ylab = "Energy sub metering")
dev.off()