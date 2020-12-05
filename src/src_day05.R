# libraries required
library(here)
library(dplyr)

#x <- data.frame(V1 = c( "BBFFBBFRLL", "BFFFBBFRRR", "FFFBBBFRRR"))

data <- read.delim(here('data', 'day_05.txt'), header = FALSE)
tmp <- strsplit(data$V1, "")
seat2 <- 0
bla <- c()

for (m in 1:length(tmp)){
# rows
lower_threshold <- 0
upper_threshold <-127


for (i in 1:7) {
  if (tmp[[m]][i] == "F") {
    temp <- round((upper_threshold-lower_threshold)/2)
    lower_threshold <- lower_threshold
    upper_threshold <- upper_threshold - temp
 #   print(paste(temp, lower_threshold, upper_threshold, sep = " "))
  } else if (tmp[[m]][i] == "B"){
    temp <- round((upper_threshold-lower_threshold)/2)
    lower_threshold <- lower_threshold + temp
    upper_threshold <- upper_threshold 
#   print(paste(temp, lower_threshold, upper_threshold, sep = " "))
  }
  if (tmp[[m]][7] == "F") {
    row_pow <- lower_threshold} else {row_pow <- upper_threshold}
}

# columns
lower_threshold_col <- 0
upper_threshold_col <- 7

for (k in 8:10) {
  print(tmp[[m]][k])
  if (tmp[[m]][k] == "L") {
    temp <- round((upper_threshold_col-lower_threshold_col)/2)
    lower_threshold_col <- lower_threshold_col
    upper_threshold_col <- upper_threshold_col - temp
 #   print(paste(temp, lower_threshold_col, upper_threshold_col, sep = " "))
  } else if (tmp[[m]][k] == "R"){
    temp <- round((upper_threshold_col-lower_threshold_col)/2)
    lower_threshold_col <- lower_threshold_col + temp
    upper_threshold_col <- upper_threshold_col 
   # print(paste(temp, lower_threshold_col, upper_threshold_col, sep = " "))
  }
  if (tmp[[m]][10] == "L") {
  col_pow <- lower_threshold_col} else {col_pow <- upper_threshold_col}
}

# compute seat
seat = row_pow*8+col_pow
print(seat)
# compute highest seat number
if (seat > seat2) {
  seat2 <- seat
}
bla[m] <- seat
}

# puzzle2
pff <- seq(8:976)
pff[pff %in% bla == FALSE]
