# libraries required
library(tidyverse)
library(here)

# data input
data <- read.delim(here('data', 'Day_01.txt'))
str(data)

################################################# PUZZLE 1  #############################################
# way 1: slow and ugly
i <- 1
a <- 1
df <- data.frame(number1 = 0, number2 = 0, sum_numbers = 0)

for (i in 1:(nrow(data)-1)) {
  j <- i+1
  
  while (j <= nrow(data)) {
    df[a,1] <- data[i,1]
    df[a,2] <- data[j,1]
    df[a,3] <- df[a,1]+df[a,2]
    
    a <- a+1 #increment row in dataframe with sums
    j <- j+1 
  }
  }
df[df$sum_numbers == 2020, ]

# way 2: nice and quick, working for 2 elements combination only though
colnames(data) <- 'value'
data$diff <- 2020-data$value
data[data$diff %in% data$value == TRUE,]

# after internet search one more elegant solution
data %>% 
  expand(value, value1 = value) %>% 
  filter(value < value1) %>%
  filter((value+value1) == 2020)

################################################# PUZZLE 2  #############################################

df <- data.frame(number1 = 0, number2 = 0, number3 = 0,  sum_numbers = 0)

for (i in 1:nrow(data)) {
  for (j in i:nrow(data)) {
    for (k in j:nrow(data)) {
      if (data[i, 1] + data[j, 1] + data[k, 1] == 2020) {
        tmp <- paste(data[i, 1], data[j, 1],data[k, 1], sep=" ")
        print(tmp)}
      
    }
  }
}
