flights <- read.table("/temp/flights.csv", header=TRUE,sep=",")


names(flights)[names(flights)=="origin"] <- "[Airport of origin]"
names(flights)[names(flights)=="temp"] <- "[Approximate temperature at scheduled time of departure]"
names(flights)[names(flights)=="dep_delay"] <- "[Departure Delay]"
names(flights)[names(flights)=="arr_delay"] <- "[Arrival Delay]"
names(flights)[names(flights)=="air_time"] <- "[Air Time in Minutes]"
names(flights)[names(flights)=="seats"] <- "[Seating Capacity of Airplane]"

#show sample rows
flights[1:10,]

#show all rows
flights
