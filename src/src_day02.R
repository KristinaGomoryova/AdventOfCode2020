library(here)
library(tidyverse)
library(stringr)

############################################# PUZZLE 1 #####################################################
# data input
data <- read.delim(here('data', 'day_02.txt'))
#data <- as.data.frame(data[c(1:3),])
colnames(data) <- 'V1'


#clean data
data <- data %>%
  separate(V1, into = c("number", "letter", "password"), sep = " ") %>%
  separate(number, into = c("lowerRange", "upperRange"), sep = "-")
data$letter <- gsub( ":", "", data$letter)

data$lowerRange <- as.numeric(data$lowerRange)
data$upperRange <- as.numeric(data$upperRange)

data$valid <- 0
data$count <- 0

data$count <- str_count(data$password, data$letter)

data[which(data$count >= data$lowerRange & data$count <= data$upperRange), "valid"] <- 1
#data$valid <- ifelse((data$count >= data$lowerRange) & (data$count <= data$upperRange), 1, 0 )

sum(data$valid)

