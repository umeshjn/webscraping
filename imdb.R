#Loading the rvest package
library('rvest')

#Specifying the url for desired website to be scrapped
url <- 'http://www.imdb.com/search/title?count=100&release_date=2016,2016&title_type=feature'

#Reading the HTML code from the website
webpage <- read_html(url)

## Fetching Rank
rank = as.numeric(html_text(html_nodes(webpage,'.text-primary')))

## Fetching Title
title = html_text(html_nodes(webpage,'.lister-item-header a'))

## Fetching ratings
ratings = as.numeric(html_text(html_nodes(webpage, ".ratings-imdb-rating strong")))

## Fetching duration
duration = html_text(html_nodes(webpage, ".text-muted .runtime"))

## fetching description
description = gsub("^\\s+|\\s+$", "", html_text(html_nodes(webpage, '.ratings-bar+ .text-muted')))

## Fetching Genre
genre = gsub("^\\s+|\\s+$", "", html_text(html_nodes(webpage, ".text-muted .genre")))

## Fetching Directors
directors = html_text(html_nodes(webpage, ".text-muted+ p a:nth-child(1)"))

write.csv(cbind.data.frame(rank, title, ratings, duration, genre, description, directors), "imdb_top100_2016.csv", row.names = FALSE)


