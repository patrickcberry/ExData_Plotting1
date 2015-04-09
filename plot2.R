fn <- "household_power_consumption.txt"
dat <- read.csv2( fn, skip=grep("1/2/2007", readLines(fn) )-1,nrows=60*24*2, header = FALSE, na.strings = c("?"), comment.char='', colClasses = "character")

dates <- strptime(paste(dat[,1],dat[,2]), "%d/%m/%Y %H:%M:%S" )
dat[,3] <- as.numeric(dat[,3])

plot(dates,dat$V3, type = "n", xlab ="", ylab = "")
lines(dates,dat$V3)
title( ylab = "Global Active Power (kilowatts)")

png("plot2.png", width = 480, height = 480 )
plot(dates,dat$V3, type = "n", xlab ="", ylab = "")
lines(dates,dat$V3)
title( ylab = "Global Active Power (kilowatts)")
dev.off()