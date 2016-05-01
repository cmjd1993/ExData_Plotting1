## This is the code for plot 3. 

## Set path and load data as a csv

path <- "~/Desktop/CathyCoursera/"
household <- read.csv(paste0(path,"household_power_consumption.txt"), 
                      header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subset for the dates 01/02/2007 & 02/02/2007 as advised in exercise
## instructions

sub_household <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Set Global_active_power to a numeric using the as.numeric command

sub_household$Global_active_power <- as.numeric(sub_household$Global_active_power)

## Using str() function, create a new variable "date_time" that give full 
## date & time. 

sub_household$date_time <- strptime(paste(subSetData$Date, 
                         subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Change Sub_metering variables to numeric using the as.numeric() command

sub_household$Sub_metering_1 <- as.numeric(sub_household$Sub_metering_1)

sub_household$Sub_metering_2 <- as.numeric(sub_household$Sub_metering_2)

sub_household$Sub_metering_3 <- as.numeric(sub_household$Sub_metering_3)

## NOTE: This time I have to save the plot stright into the file device as the 
## legend is cut off when saving a screen device into a file device.
## Use "basic" package to plot each line one by one. Start with Sub_metering_1

png("plot3.png", width=480, height=480)

plot(sub_household$date_time, sub_household$Sub_metering_1, type="l", 
     ylab="Energy Submetering", xlab="")

## Then add Sub_metering_2 with lines() command, make line "red"

lines(sub_household$date_time, sub_household$Sub_metering_2, type="l", 
      col="red")

## Then also add Sub_metering_3 with lines() command, make line "blue"

lines(sub_household$date_time, sub_household$Sub_metering_3, type="l", 
      col="blue")

## Add a legend to differentiate between the 3 different coloured lines.

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"))

dev.off()

