#Plot 1

rm(list=ls())

#Read the household power consumption in a variable called hpc
hpc <- read.table("household_power_consumption.txt", na.string = "?",  header= TRUE, sep = ";")


#convert dates and measure
hpc <- transform(hpc, Date = as.Date(as.character(Date), "%d/%m/%Y"), Global_active_power = as.numeric(as.character(Global_active_power)))

#subset the dataset based on the required dates
begin_feb_glob_act_power_ds <- subset(hpc, Date %in% as.Date(c("2007/02/01", "2007/02/02")))

#Open the png Device
png("plot1.png", width=480, height=480)

#create a histogram of the data
hist(begin_feb_glob_act_power_ds$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#close the png device
dev.off()