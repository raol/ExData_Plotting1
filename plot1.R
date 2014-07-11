require("sqldf")
source("download_data.R")

data <- read.csv.sql(
    datafilename, 
    sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
    sep=";",
    row.names=FALSE)

# According to png help, default value for both width and height fields is 480
# so there is no need to specify width and lenght exactly
png(filename="plot1.png", bg="transparent")
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", 
     col="red", main="Global Active Power")
dev.off()
