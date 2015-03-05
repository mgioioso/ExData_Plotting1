# examine how household energy usage varies over a 2-day period in 
# February, 2007
library(dplyr)
# Read the data from file
# Reading 1/8 the total num rows, determined by eye to be where the data is
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                 nrows=259407, na.strings="?", as.is=1:9); 

# only using data from the dates 2007-02-01 and 2007-02-02
df <- mutate(df, DateTime=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"));
df2 <- filter(df,(DateTime>=as.POSIXct("2007-02-01")) & (DateTime<as.POSIXct("2007-02-03")));

# Plot a time series of Global Active Power
png(filename="plot3.png");
par(ann=FALSE, cex=1);
with(df2, plot(DateTime, Sub_metering_1, type="l"));
title(ylab="Energy sub metering");
lines(df2$DateTime, df2$Sub_metering_2, col="red");
lines(df2$DateTime, df2$Sub_metering_3, col="blue");
legend(x="topright", legend=c(names(df2)[7:9]), col=c("black", "red", "blue"),
       lty=1)

dev.off()