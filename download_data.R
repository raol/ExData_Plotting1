datafolder <- "data"
zipname <- "household_power_consumption.zip"
fullzipname <- paste(datafolder, zipname, sep="/")
datafilename <- paste(datafolder, "household_power_consumption.txt", sep="/")

if(!file.exists(datafolder)) {
    message("creating data folder...")
    dir.create(datafolder)
}

if(!file.exists(fullzipname)) {
    message("downloading file...")
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url, destfile=fullzipname)
}

if(!file.exists(datafilename)) {
    message("extracting data...")
    unzip(fullzipname, exdir=datafolder)
}
