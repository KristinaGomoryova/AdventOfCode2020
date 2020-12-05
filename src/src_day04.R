# libraries required
library(here)
library(stringr)

####################################################### puzzle 1 ##############################################

lines <- readLines(here('data', 'day_04.txt'))
i <- cumsum(lines == '')
df_by<- by(lines, i, paste, collapse='\n')

bla <- as.list(df_by)

df<- do.call(rbind, bla)
df <- as.data.frame(df)

valid <- 0
for (i in 1:nrow(df)) {
  if (str_count(df$V1[i], ":") == 8) {
    valid <- valid+1
  } else {
    if (str_count(df$V1[i], ":") == 7) {
      if (grepl("cid", df$V1[i]) == 0) {
        valid <- valid+1
      }
    }
  }
  print(valid)
}

####################################################### puzzle 2 ##############################################
 
tmp <- strsplit(df$V1, c("\\s|\n "))

# find regexes
# byr 
library(rebus)
number_range(1920, 2002)
str_detect(tmp[[6]], "^byr:(?:19[2-9][0-9]|200[0-2])")

#iyr
number_range(2010, 2020)
str_detect(tmp[[3]], "^iyr:(?:201[0-9]|2020)") 

#eyr
number_range(2020, 2030)
str_detect(tmp[[3]], "^eyr:(?:202[0-9]|2030)") 

#hgt
number_range(150, 193)
number_range(59, 76)
#str_detect(tmp[[7]],"^hgt:((?:1[5-8][0-9]|19[0-3])(cm))|((?:59|6[0-9]|7[0-6])(in))")
str_detect(tmp[[7]],"^hgt:((?:59|6[0-9]|7[0-6])[in]{2}|((?:1[5-8][0-9]|19[0-3])[cm]{2}))")

#hcl
str_detect(tmp[[2]],"^hcl:#([a-z0-9]){6}")

#ecl
str_detect(tmp[[2]],"^ecl:(amb|blu|brn|gry|grn|hzl|oth)")

#pid
str_detect(tmp[[2]],"^pid:[0-9]{9}")

#cid is ignored

valid2 <- 0

for (i in 1: length(tmp)) {
  if ((TRUE %in% str_detect(tmp[[i]], "^byr:(?:19[2-9][0-9]|200[0-2])$")) & (TRUE %in% str_detect(tmp[[i]], "^iyr:(?:201[0-9]|2020)$")) & (TRUE %in% str_detect(tmp[[i]], "^eyr:(?:202[0-9]|2030)$")) & (TRUE %in% str_detect(tmp[[i]],"^hgt:((?:59|6[0-9]|7[0-6])[in]{2}|((?:1[5-8][0-9]|19[0-3])[cm]{2}))")) & (TRUE %in% str_detect(tmp[[i]],"^hcl:#([a-z0-9]){6}$")) & (TRUE %in% str_detect(tmp[[i]],"^ecl:(amb|blu|brn|gry|grn|hzl|oth)")) & (TRUE %in% str_detect(tmp[[i]],"^pid:[0-9]{9}$"))){
    valid2 <- valid2+1
    print(i)
  }
}


