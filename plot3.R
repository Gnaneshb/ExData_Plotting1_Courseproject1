## Getting full dataset
EPC <- read.csv("C:/Users/GNANESH BAMMIDI/Desktop/Courseprojects/ExData_Plotting1/Project1/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
EPC$Date <- as.Date(EPC$Date, format="%d/%m/%Y")

## Subsetting the data
EPC_subset <- subset(EPC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(EPC)

## Converting dates
EPC_suset_convert_data <- paste(as.Date(EPC_subset$Date), EPC_subset$Time)
EPC_subset$Datetime <- as.POSIXct(EPC_suset_convert_data)

## Plot 3
with(EPC_subset, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="C:/Users/GNANESH BAMMIDI/Desktop/Courseprojects/ExData_Plotting1/Project1/plot3.png", height=480, width=480)
dev.off()