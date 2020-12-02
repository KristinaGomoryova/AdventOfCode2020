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

############################################# PUZZLE 2 #####################################################

data2 <- read.delim(here('data', 'day_02.txt'))
colnames(data2) <- 'V1'

#clean data
data2 <- data2 %>%
  separate(V1, into = c("number", "letter", "password"), sep = " ") %>%
  separate(number, into = c("lowerRange", "upperRange"), sep = "-")
data2$letter <- gsub( ":", "", data2$letter)

data2$lowerRange <- as.numeric(data2$lowerRange)
data2$upperRange <- as.numeric(data2$upperRange)

x<- 0
for (i in 1:nrow(data2)){
  # print(data2$password_char[[i]][data2$lowerRange[i]])
  # print(data2$password_char[[i]][data2$upperRange[i]])
  # print(data2$letter[i])
  data2[which(((data2$password_char[[i]][data2$lowerRange[i]] == data2$letter[i]))), 'valid_LR'] <- 1
  print(paste(i, 
              data2$letter[i], 
              data2$password_char[[i]][data2$lowerRange[i]], 
              data2$password_char[[i]][data2$upperRange[i]],
              data2$password_char[[i]][data2$lowerRange[i]] == data2$letter[i],
              data2$password_char[[i]][data2$upperRange[i]] == data2$letter[i],
              data2$password_char[[i]][data2$lowerRange[i]] != data2$letter[i],
              data2$password_char[[i]][data2$upperRange[i]] != data2$letter[i],
              '***',
              (data2$password_char[[i]][data2$lowerRange[i]] == data2$letter[i] &   data2$password_char[[i]][data2$upperRange[i]] != data2$letter[i]),
              (data2$password_char[[i]][data2$lowerRange[i]] != data2$letter[i] & data2$password_char[[i]][data2$upperRange[i]] == data2$letter[i]),
              (data2$password_char[[i]][data2$lowerRange[i]] == data2$letter[i] &   data2$password_char[[i]][data2$upperRange[i]] != data2$letter[i]) | (data2$password_char[[i]][data2$lowerRange[i]] != data2$letter[i] & data2$password_char[[i]][data2$upperRange[i]] == data2$letter[i])
        ))
  if ((data2$password_char[[i]][data2$lowerRange[i]] == data2$letter[i] &   data2$password_char[[i]][data2$upperRange[i]] != data2$letter[i]) | (data2$password_char[[i]][data2$lowerRange[i]] != data2$letter[i] & data2$password_char[[i]][data2$upperRange[i]] == data2$letter[i])) {
    x <- x+1
  }
}


