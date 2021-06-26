create or replace view AIRPORT_DELAY_CANCELLATIONS as
select airports.airport as airport_desc
    , airports.iata_code as airport_code
    , flight_target
    , nvl(sum(delay_airline_carrier), 0) as delay_airline_carrier
    , nvl(sum(delay_weather), 0) as delay_weather
    , nvl(sum(delay_national_air_system), 0) as delay_national_air_system
    , nvl(sum(delay_security), 0) as delay_security
from (
    select origin_airport as airport, 'ORIGIN' as flight_target, "'A'" as delay_airline_carrier, "'B'" as delay_weather, "'C'" as delay_national_air_system, "'D'" as delay_security from flights
    pivot(sum(cancelled) for cancellation_reason in ('A', 'B', 'C', 'D')) as cancellation_stats
    union all 
    select destination_airport as airport, 'DESTINATION' as flight_target, "'A'" as delay_airline_carrier, "'B'" as delay_weather, "'C'" as delay_national_air_system, "'D'" as delay_security from flights
    pivot(sum(cancelled) for cancellation_reason in ('A', 'B', 'C', 'D')) as cancellation_stats
) airport_fact
inner join airports on airport_fact.airport = airports.iata_code
group by airports.airport, airports.iata_code, flight_target
order by airports.iata_code, flight_target
;
