fn <- "household_power_consumption.txt"
dat <- read.csv2( fn, skip=grep("1/2/2007", readLines(fn) )-1,nrows=60*24*2, header = FALSE, na.strings = c("?"), comment.char='', colClasses = "character")

dates <- strptime(paste(dat[,1],dat[,2]), "%d/%m/%Y %H:%M:%S" )
dat[,3] <- as.numeric(dat[,3])
dat[,4] <- as.numeric(dat[,4])
dat[,5] <- as.numeric(dat[,5])
dat[,7] <- as.numeric(dat[,7])
dat[,8] <- as.numeric(dat[,8])
dat[,9] <- as.numeric(dat[,9])

par(mfrow = c(2,2))

plot(dates,dat$V3, type = "n", xlab ="", ylab = "")
lines(dates,dat$V3)
title( ylab = "Global Active Power (kilowatts)")

plot(dates,dat$V5, type = "n", xlab ="", ylab = "")
lines(dates,dat$V5)
title( ylab = "Voltage")
title( xlab = "datetime")

plot(dates,dat$V7, type = "n", xlab ="", ylab = "")
lines(dates,dat$V7)
lines(dates,dat$V8, col = "red")
lines(dates,dat$V9, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1, bty ="n" )
title( ylab = "Energy sub metering")

plot(dates,dat$V4, type = "n", xlab ="", ylab = "")
lines(dates,dat$V4)
title( ylab = "Global_reactive_power")
title( xlab = "datetime")

#dev.copy(png, file="plot4.png", width = 480, height = 480 )
#dev.off()

png("plot4.png", width = 480, height = 480 )

par(mfrow = c(2,2))

plot(dates,dat$V3, type = "n", xlab ="", ylab = "")
lines(dates,dat$V3)
title( ylab = "Global Active Power (kilowatts)")

plot(dates,dat$V5, type = "n", xlab ="", ylab = "")
lines(dates,dat$V5)
title( ylab = "Voltage")
title( xlab = "datetime")

plot(dates,dat$V7, type = "n", xlab ="", ylab = "")
lines(dates,dat$V7)
lines(dates,dat$V8, col = "red")
lines(dates,dat$V9, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1, bty ="n" )
title( ylab = "Energy sub metering")

plot(dates,dat$V4, type = "n", xlab ="", ylab = "")
lines(dates,dat$V4)
title( ylab = "Global_reactive_power")
title( xlab = "datetime")

dev.off()