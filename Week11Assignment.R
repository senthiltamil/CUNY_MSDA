
library(jsonlite)
library(RCurl)

#interface that takes a query string
getNYArticle <- function(q, begin_date)
{
  uriformat <- "http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=%s&begin_date=%s&api-key=0818ce328292462bef2f1cde0b25dfb6:2:71883016"
  nyuri <- sprintf(uriformat,q,begin_date)
  print(nyuri)
  nyresponse <- getURL(nyuri)  
  ls.nyresponse <- fromJSON(txt=nyresponse)
  ds.nyarticle <- ls.nyresponse[[1]][[2]][1]
  return(ds.nyarticle)
}

ds <- getNYArticle("India+election","20140101")



