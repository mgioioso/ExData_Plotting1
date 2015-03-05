# examine how household energy usage varies over a 2-day period in 
# February, 2007
library(dplyr)
# Read the data from file
# Reading 1/8 the total num rows, determined by eye to be where the data is
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                 nrows=259407, na.strings="?", as.is=1:9); 

# only using data from the dates 2007-02-01 and 2007-02-02
df <- mutate(df, Date=as.Date(Date, format="%d/%m/%Y"));
df2 <- filter(df,(Date>=as.Date("2007-02-01")) & (Date<=as.Date("2007-02-02")));
df2 <- mutate(df2, Time=as.POSIXct(Time, format="%H:%M:%S"));

# plot the histogram of Global_active_power

hist(df2$Global_active_power,col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)");
dev.copy(png, file="plot1.png");
dev.off()