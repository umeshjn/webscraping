#Loading the rvest package
library('rvest')

## Historical IPO Details
webpage <- read_html("http://www.moneycontrol.com/ipo/sme-ipo-historic-table")

## Fetching the table data
data =  webpage %>%   html_nodes("table") %>% html_table(fill = TRUE) %>% .[[2]] 

## Clean up the data and write to csv
head(data)
dim(data)
data = data[-1, c(1, 2, 4:12)]

## Cleaning up the names of the columns
names(data) = c("Date", "IPOName", "LotSize", "IssueSize(Crores)", "ListingDate", "IssuePrice", "ListingOpen", "ListClose", "ListingGains(%)", "CMP", "CurrentGains(%)")

head(data)

## Writing into csv
write.csv(data, "historical_IPO_data.csv", row.names = FALSE)



