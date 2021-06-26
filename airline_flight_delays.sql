create or replace view AIRLINE_FLIGHT_DELAYS as
select a.iata_code as airline_code
    , a.airline as airline_desc
    , tf.total_flights as total_flights
    , df.delayed_flights as delayed_flights
    , (df.delayed_flights / tf.total_flights) * 100 as delayed_flight_percentage // not needed but interesting data point
from (
    select airline, count(*) as total_flights 
    from flights
    group by airline
) tf
inner join airlines a
on tf.airline = a.iata_code
inner join (
    select airline, count(*) as delayed_flights from flights 
    where departure_delay > 0
    group by airline
) df
on tf.airline = df.airline
order by delayed_flights desc
;
