library(here)
library(dplyr)

#################################################### puzzle 1 ################################################

data <- read.delim(here('data', 'day_03.txt'), header = FALSE)
str(data)

data_list <- strsplit(data$V1, "")
str(data_list)

# find how many times you need to replicate the rows
nrow(data)*3

# find how long is every row now
length(data_list[[1]])

# how many times we'll multiply every row?
nrow(data)*3 / (length(data_list[[1]])) # so 32 times to be sure -- later edited to 90 (based on puzzle 2)

data_full <- data
data_full[] <- mapply(strrep, data, 90)
data_full_list <- strsplit(data_full$V1, "")
str(data_full)

# count the trees
j <- 4
tree <- 0

for (i in 2:nrow(data)){
  if (data_full_list[[i]][j] == '#') {
    tree <- tree+1
  }
  j <- j+3
}


################################################# puzzle 2 #############################################
# slopes to check 
#Right 1, down 1.
#Right 3, down 1. (This is the slope you already checked.)
#Right 5, down 1.
#Right 7, down 1.
#Right 1, down 2.

#Right 1, down 1.
j <- 2
tree1 <- 0
for (i in 2:nrow(data)){
  if (data_full_list[[i]][j] == '#') {
    tree1 <- tree1+1
  }
  j <- j+1
}

#Right 3, down 1.
j <- 4
tree2 <- 0
for (i in 2:nrow(data)){
  if (data_full_list[[i]][j] == '#') {
    tree2 <- tree2+1
  }
  j <- j+3
}

#Right 5, down 1.
j <- 6
tree3 <- 0
for (i in 2:nrow(data)){
  if (data_full_list[[i]][j] == '#') {
    tree3 <- tree3+1
  }
  j <- j+5
}

#Right 7, down 1.
j <- 8
tree4 <- 0
for (i in 2:nrow(data)){
  if (data_full_list[[i]][j] == '#') {
    tree4 <- tree4+1
  }
  j <- j+7
}

#Right 1, down 2.
j <- 2
tree5 <- 0
for (i in 2:nrow(data)){
  if (i%%2 != 0) {
  if (data_full_list[[i]][j] == '#') {
    tree5 <- tree5+1
  }
  j <- j+1
}
}

87*169*99*98*53
