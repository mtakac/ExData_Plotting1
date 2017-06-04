## Download and extract data needed for plotting.
## If directory "./data" already exists the download is skipped.
## Args: None
## Return: Path to downloaded file "household_power_consumption.txt"
download <- function() {
    url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    print(paste("Downloading data files from", url, "..."))

    if(file.exists("./data")) {
        print("... Skipped!")
    } else {
        file_dest <- "./data/household-power-consumption.zip"
        dir.create("./data")
        download.file(url, destfile = file_dest, method = "curl")
        print("Done!")
        print("Extracting downloaded files into './data' directory...")
        unzip(zipfile = file_dest, exdir = "./data")
        print("Done!")
        print("Cleaning up...")
        file.remove(file_dest)
        print("Done!")
    }

    file.path("./data/household_power_consumption.txt")
}
