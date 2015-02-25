Copy (
select f.Origin, f.Carrier, w.temp, f.dep_delay, f.arr_delay, f.air_time, p.seats, 
	to_timestamp(to_char(f.year,'0000') || to_char(f.month,'00') || to_char(f.day,'00') || to_char(f.hour,'00') || to_char(f.minute,'00'),'YYYY-MM-DD HH24:MI') as FlightDepDateTime
from flights as f 
	left join planes as p on p.tailnum = f.tailnum
	left join weather as w on w.origin = f.origin and w.year = f.year and w.month = f.month and w.day = f.day and w.hour = f.hour
where f.dest = 'LAX' 
and f.origin = 'EWR' 
and f.year = 2013
and ((f.month = 2 and f.day > 22) or (f.month = 3 and f.day < 2))
order by FlightDepDateTime
) To '/temp/flights.csv' With CSV Header;
