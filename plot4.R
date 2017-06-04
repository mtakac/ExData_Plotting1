source("download.R")
source("read_data.R")

## Create plot4 and write it into the png file
## Args: None
## Return: None
plot4 <- function() {
    file_path <- download();
    df <- read_data(file_path);

    ## Filter data for first two days in February
    print("Filtering data...")
    df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")
    print("Done!")

    ## Add datetime variable to the data set
    datetime <- strptime(with(df, paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

    ## Open connection to png graphic device
    print("Writting graph into file './plot4.png'...")
    png(filename = "./plot4.png")
    ## Plot data into graph
    par(mfcol = c(2, 2))

    plot(datetime, df$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
    plot(datetime, df$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
    lines(datetime, df$Sub_metering_1, col = "black", lwd = 1)
    lines(datetime, df$Sub_metering_2, col = "red", lwd = 1)
    lines(datetime, df$Sub_metering_3, col = "blue", lwd = 1)
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, bty = "n")
    plot(datetime, df$Voltage, ylab = "Voltage", type = "l")
    plot(datetime, df$Global_reactive_power, ylab = "Global Reactive Power", type = "l")
    ## Close connection to png graphic device
    dev.off()
    print("Done!")
}
