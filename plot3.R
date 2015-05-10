#Plot 3

#Clean the environment
rm(list=ls())

#Read the household power consumption in a variable called hpc
hpc <- read.table("household_power_consumption.txt", na.string="?",  header= TRUE, sep = ";")


hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#convert dates and measure
hpc <- transform(hpc, Date = as.Date(as.character(Date), "%d/%m/%Y"), 
                 Sub_metering_1 = as.numeric(as.character(Sub_metering_1)),
                 Sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
                 Sub_metering_3 = as.numeric(as.character(Sub_metering_3))
                 )

#subset the dataset based on the required dates
begin_feb_glob_act_power_ds <- subset(hpc, Date %in% as.Date(c("2007/02/01", "2007/02/02")))

#Set the x and y
#yrange <- range(begin_feb_glob_act_power_ds$Sub_metering_1,begin_feb_glob_act_power_ds$Sub_metering_2,begin_feb_glob_act_power_ds$Sub_metering_3)
x <- begin_feb_glob_act_power_ds$DateTime

#Open the png Device
png("plot3.png", width=480, height=480)


#create a line chart of the data. Type = "l" is for line type
plot(x, begin_feb_glob_act_power_ds$Sub_metering_1, type = "l", col = "Black", xlab="", ylab="Energy sub metering")
lines(x, begin_feb_glob_act_power_ds$Sub_metering_2, type = "l", col = "Red")
lines(x, begin_feb_glob_act_power_ds$Sub_metering_3, type = "l", col = "Blue")

legend("topright", lty=1, col=c("Black", "Red", "Blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Tuen Off the devive
dev.off()
