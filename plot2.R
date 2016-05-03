## This is the code for plot 2. 

## Set path and load data as a csv

path <- "~/Desktop/CathyCoursera/"
household <- read.csv(paste0(path,"household_power_consumption.txt"), 
                      header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subset for the dates 01/02/2007 & 02/02/2007 as advised in exercise
## instructions

sub_household <- household[household$Date %in% c("1/2/2007","2/2/2007") ,]

## Set Global_active_power to a numeric using the as.numeric command

sub_household$Global_active_power <- as.numeric(sub_household$Global_active_power)

## Using strptime() command, create a new variable "date_time" that give full 
## date & time. 

sub_household$date_time <- strptime(paste(subSetData$Date, 
                        subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Using the subset created above, create plot on screen device 

with(sub_household, plot( x = date_time, y = Global_active_power,
                          type = "l", xlab = "", 
                          ylab = "Global Active Power (kilowatts)"))

## Save a PNG version.

dev.copy(png, file = "plot2.png",  width=480, height=480)
dev.off()
