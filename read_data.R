library(dplyr)

## Read data from file into data frame.
## Args: file - a path to file with data
##       nrows (optional) - number of rows to read in
## Return: data frame constructed by dplyr method tlb_df()
read_data <- function(file, nrows = -1) {
    print(paste("Reading in data from", file, "..."))
    df <- tbl_df(read.table(file, sep=";", header = TRUE, na.strings = "?", nrows = nrows))
    print("Done!")
    df
}
