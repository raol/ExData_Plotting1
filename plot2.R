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
png(filename="plot2.png", bg="transparent")

plot(x=data$Date, y=data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

