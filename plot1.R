## This is the code for plot 1. 

## Set path and load data as a csv

path <- "~/Desktop/CathyCoursera/"
household <- read.csv(paste0(path,"household_power_consumption.txt"), 
                      header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subset for the dates 01/02/2007 & 02/02/2007 as advised in exercise
## instructions

sub_household <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Set Global_active_power to a numeric using the as.numeric command

sub_household$Global_active_power <- as.numeric(sub_household$Global_active_power)

## Using the subset created above, create histogram on screen device

hist(sub_household$Global_active_power, col = "red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power")

## Save a PNG version.

dev.copy(png, file = "plot1.png",  width=480, height=480)
dev.off()
