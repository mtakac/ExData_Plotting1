source("download.R")
source("read_data.R")

## Create plot3 and write it into the png file
## Args: None
## Return: None
plot3 <- function() {
    file_path <- download();
    df <- read_data(file_path);

    ## Filter data for first two days in February
    print("Filtering data...")
    df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")
    print("Done!")

    ## Add datetime variable to the data set
    df$Datetime <- strptime(with(df, paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

    ## Open connection to png graphic device
    print("Writting graph into file './plot3.png'...")
    png(filename = "./plot3.png")
    ## Plot data into graph
    plot(df$Datetime, df$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
    lines(df$Datetime, df$Sub_metering_1, col = "black", lwd = 1)
    lines(df$Datetime, df$Sub_metering_2, col = "red", lwd = 1)
    lines(df$Datetime, df$Sub_metering_3, col = "blue", lwd = 1)
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
    ## Close connection to png graphic device
    dev.off()
    print("Done!")
}
