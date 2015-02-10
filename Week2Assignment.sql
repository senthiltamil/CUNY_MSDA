/*
	Farthest travelling from any origin
*/
select distinct origin, dest, distance
from flights
where distance = (
select max(distance)
from flights
)
;

/*
	Farthest travelling per Origin
*/
select distinct flights.origin, flights.dest, f.farthest
from flights
	join 
	(select origin, max(distance) as farthest
	 from flights
	 group by origin
	 ) as f on f.origin = flights.origin and f.farthest = flights.distance
order by flights.origin
;

/*
	Aircrats with most seats by number of engines
*/
select distinct p.manufacturer, p.model as aircraft, p.engines, p.seats
from planes as p
	join 
	(
	select p.engines, max(seats) as Mostseats
	from planes as p 
	group by p.engines
	order by p.engines
	) as p1 on p1.engines = p.engines and p1.MostSeats = p.Seats
order by p.engines
;	

/*
	Get the weather condition with newyork city departure delays. Weather data exists only for 2013
*/
select distinct f.year, f.month, f.day, f.dep_time/100 as dephour, f.dep_time, dep_delay, w.temp, w.dewp, w.humid, w.wind_dir, w.wind_speed, w.wind_gust, w.precip, w.pressure, w.visib
from flights as f 
	 join weather as w on w.origin = f.origin and w.year = f.year and w.month = f.month and w.day = f.day and w.hour = f.dep_time/100
where f.origin in ('JFK', 'LGA')
and dep_delay > 0   -- assuming < 0 = early departure
order by f.year, f.month, f.day, dephour
limit 1000
;

/*
 Delayed flights
*/
select p.year as ManufacturedYear, count(1) as delayedflights
from flights as f	
	join planes as p on p.tailnum = f.tailnum
where f.dep_delay > 0
and p.year is not null
group by p.year
order by p.year
;

-- Top 10 airlines who had best ontime flight departure with respect to their total flights

select a.name, count(1) as flightcount, count(case when dep_delay = 0 then 1 else null end) as flightwithoutdelay,
	cast(count(case when dep_delay = 0 then 1 else null end) /cast(count(1) as numeric(10,2)) as numeric(10,3)) as OnTimeFlightRatio
from flights as f 
	join airlines as a on a.carrier = f.carrier
where f.year = 2013
group by a.carrier
order by OnTimeFlightRatio desc
limit 10
;


