create or replace view AIRLINE_FLIGHT_ARRIVALS as
select a.iata_code as airline_code
    , a.airline as airline_desc
    , tf.total_flights as total_flights
    , lf.late_flights as late_flights
    , (lf.late_flights / tf.total_flights) * 100 as late_flight_percentage
from (
    select airline, year, count(*) as total_flights 
    from flights
    group by airline, year
) tf
inner join airlines a
on tf.airline = a.iata_code
inner join (
    select airline, year, count(*) as late_flights from flights 
    where arrival_delay > 0
    group by airline, year
) lf
on tf.airline = lf.airline and tf.year = lf.year
where tf.year = 2015
order by late_flight_percentage desc
;
