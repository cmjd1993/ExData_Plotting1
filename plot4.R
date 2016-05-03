## This is the code for plot 4. 

## Set path and load data as a csv

path <- "~/Desktop/CathyCoursera/"
household <- read.csv(paste0(path,"household_power_consumption.txt"), 
                      header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subset for the dates 01/02/2007 & 02/02/2007 as advised in exercise
## instructions

sub_household <- household[household$Date %in% c("1/2/2007","2/2/2007") ,]

## Set Global_active_power,Global_reactive_power & Voltage to a numeric using 
## the as.numeric command

sub_household$Global_active_power <- as.numeric(sub_household$Global_active_power)

sub_household$Global_reactive_power <- 
        as.numeric(sub_household$Global_reactive_power)

sub_household$Voltage <- as.numeric(sub_household$Voltage)

## Using strptime() command, create a new variable "date_time" that give full 
## date & time.. 

sub_household$date_time <- strptime(paste(subSetData$Date, 
                        subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Change Sub_metering variables to numeric using the as.numeric() command

sub_household$Sub_metering_1 <- as.numeric(sub_household$Sub_metering_1)

sub_household$Sub_metering_2 <- as.numeric(sub_household$Sub_metering_2)

sub_household$Sub_metering_3 <- as.numeric(sub_household$Sub_metering_3)


## NOTE: This time I have to save the plot stright into the file device as the 
## legend is cut off when saving a screen device into a file device.
## Create all 4 plots as below

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

## Plot 1

with(sub_household, plot( x = date_time, y = Global_active_power,
                          type = "l", xlab = "", 
                          ylab = "Global Active Power"))

## Plot 2

with(sub_household, plot( x = date_time, y = Voltage, type="l", xlab="datetime",
                          ylab="Voltage"))

## Plot 3

plot(sub_household$date_time, sub_household$Sub_metering_1, type="l", 
     ylab="Energy Submetering", xlab="")

lines(sub_household$date_time, sub_household$Sub_metering_2, type="l", 
      col="red")

lines(sub_household$date_time, sub_household$Sub_metering_3, type="l", 
      col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"))

## Plot 4

plot(sub_household$date_time, sub_household$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
