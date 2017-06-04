source("download.R")
source("read_data.R")

## Create plot1 and write it into the png file
## Args: None
## Return: Histogram
plot1 <- function() {
    file_path <- download();
    df <- read_data(file_path);

    ## Filter data for first two days in February
    print("Filtering data...")
    df <- filter(df, Date == "2007-02-01" | Date == "2007-02-02")
    print("Done!")

    ## Open connection to png graphic device
    print("Writting graph into file './plot.png'...")
    png(filename = "./plot1.png")
    ## Plot data into graph
    graph <- hist(
        df_feb$Global_active_power,
        col = "red",
        main = "Global Active Power",
        xlab = "Global Active Power (kilowatts)"
    )
    ## Close connection to png graphic device
    dev.off()
    print("Done!")

    return(graph)
}
