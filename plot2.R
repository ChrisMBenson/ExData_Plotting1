#Plot 2

#Clean the environment
rm(list=ls())

#Read the household power consumption in a variable called hpc
hpc <- read.table("household_power_consumption.txt", na.string="?",  header= TRUE, sep = ";")


hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#convert dates and measure
hpc <- transform(hpc, Date = as.Date(as.character(Date), "%d/%m/%Y"), Global_active_power = as.numeric(as.character(Global_active_power)))

#subset the dataset based on the required dates
begin_feb_glob_act_power_ds <- subset(hpc, Date %in% as.Date(c("2007/02/01", "2007/02/02")))

#Set the x and y
y <- begin_feb_glob_act_power_ds$Global_active_power
x <- begin_feb_glob_act_power_ds$DateTime

#Open the png Device
png("plot2.png", width=480, height=480)


#create a histogram of the data. Type = "l" is for line type
plot(x, y, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

# Tuen Off the devive
dev.off()
