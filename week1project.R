setwd("/Users/mgioioso/Documents/Personal/Data Science/Coursera Courses/Exploratory Data Analysis")
library(dplyr)
# 1/8 the total, determined by eye to be where the data is
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                 nrows=259407, na.strings="?", as.is=1:9); 

# only be using data from the dates 2007-02-01 and 2007-02-02
df <- mutate(df, Date=as.Date(Date, format="%d/%m/%Y"));
df2 <- filter(df,(Date>=as.Date("2007-02-01")) & (Date<=as.Date("2007-02-02")));
df2 <- mutate(df2, Time=as.POSIXct(Time, format="%H:%M:%S"));