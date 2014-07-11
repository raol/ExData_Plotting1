require("sqldf")
source("download_data.R")

data <- read.csv.sql(
    datafilename, 
    sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
    sep=";",
    row.names=FALSE)

data$Date <- paste(data$Date, data$Time, sep=' ')
data$Date <- strptime(data$Date, format="%d/%m/%Y %H:%M:%S")

# According to png help, default value for both width and height fields is 480
# so there is no need to specify width and lenght exactly
png(filename="plot3.png", bg="transparent")

plot(x=data$Date, y=data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
points(x=data$Date, y=data$Sub_metering_2, col="red", type="l")
points(x=data$Date, y=data$Sub_metering_3, col="blue", type="l")
legend("topright", col=c("black", "red", "blue"), lty=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()