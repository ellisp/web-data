# download New Zealand carbon unit price

library(stringr)

download.file("http://www.carbonnews.co.nz/", destfile = "tmp/carbonnews.html")

cn <- readLines("tmp/carbonnews.html")
pr <- str_match(cn, "Spot NZUs close at \\$[0-9]+\\.[0-9][0-9]")
pr <- as.numeric(str_sub(pr[!is.na(pr)], 21))

if(length(pr) != 1 | is.na(pr)){
  stop("Something wrong with the nz-carbon.R")
}

tmp <- data.frame(Day = Sys.Date(), NZU_Price = pr)
write.table(tmp, file = "data/carbon_NZU.csv", row.names = FALSE, append = TRUE, col.names = FALSE, sep = ",")
