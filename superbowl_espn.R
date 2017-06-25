library(rvest)

## Reading the Html page
webpage <- read_html("http://www.espn.com/nfl/superbowl/history/winners")

## Fetching data and cleaning
data = webpage %>% html_nodes("table") %>% html_table(fill =TRUE) %>% .[[1]]
names(data)  = data[2,]
data = data[-c(1,2),]

head(data)

## Writing into csv
write.csv(data, "superbowlwinners.csv", row.names = FALSE)


## Reading the Html page
webpage <- read_html("http://www.espn.com/nfl/superbowl/history/mvps")

## Fetching data and cleaning
data = webpage %>% html_nodes("table") %>% html_table(fill =TRUE) %>% .[[1]]
names(data)  = data[2,]
data = data[-c(1,2),]

head(data)

## Writing into csv
write.csv(data, "superbowl_MVPs.csv", row.names = FALSE)



## Reading the Html page
webpage <- read_html("http://www.espn.com/nfl/history/leaders")

## Fetching data and cleaning
data = webpage %>% html_nodes("table") %>% html_table(fill =TRUE) %>% .[[1]]
names(data)  = data[2,]
data = data[-c(1,2),]

head(data)

## Writing into csv
write.csv(data, "superbowl_TouchDownLeaders.csv", row.names = FALSE)



