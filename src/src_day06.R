library(here)
library(purrr)

data <- readLines(here('data', 'day_06.txt'))
i <- cumsum(data == '')
df_by<- by(data, i, paste, collapse='')

df <- as.list(df_by)

df<- do.call(rbind, df)
df <- as.data.frame(df)
df$V1 <- strsplit(df$V1, "")

########################################### puzzle 1 #########################################
df$str_unique <- 0
for (i in 1:nrow(df)) {
  df$str_unique[[i]] <- length(unique(df$V1[[i]]))
}
sum(df$str_unique)       

########################################## puzzle 2 #########################################
df_by<- by(data, i, paste, collapse=' ')
df <- as.list(df_by)

df2 <- lapply(df, function(x) unlist(strsplit(x, " ")))
x <- lapply(df2, function(x) strsplit(x, ""))

tmp<- c()
for (i in 1:length(x)) {
  tmp[i] <- length(Reduce(intersect,x[[i]]))
  print(i)
}

sum(tmp)
