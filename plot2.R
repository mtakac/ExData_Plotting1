source("download.R")
source("read_data.R")

## Create plot2 and write it into the png file
## Args: None
## Return: None
plot2 <- function() {
    file_path <- download();
    df <- read_data(file_path);

    ## Filter data for first two days in February
    print("Filtering data...")
    df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")
    print("Done!")

    ## Add datetime variable to the data set
    df$Datetime <- strptime(with(df, paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

    ## Open connection to png graphic device
    print("Writting graph into file './plot.png'...")
    png(filename = "./plot2.png")
    ## Plot data into graph
    plot(df$Datetime, df$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
    ## Close connection to png graphic device
    dev.off()
    print("Done!")
}
