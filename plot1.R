fn <- "household_power_consumption.txt"
dat <- read.csv2( fn, skip=grep("1/2/2007", readLines(fn) )-1,nrows=60*24*2, header = FALSE, na.strings = c("?"), comment.char='', colClasses = "character")

dat[,3] <- as.numeric(dat[,3])

hist(dat$V3, col = "red", main = "Global Active Power", xlab="")
title( xlab = "Global Active Power (kilowatts)")

png("plot1.png", width = 480, height = 480 )
hist(dat$V3, col = "red", main = "Global Active Power", xlab="")
title( xlab = "Global Active Power (kilowatts)")
dev.off()