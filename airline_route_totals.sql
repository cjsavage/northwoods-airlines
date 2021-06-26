create or replace view AIRLINE_ROUTE_TOTALS as
select airlines.airline as airline_code, airlines.iata_code as airline_desc, count(*) as unique_routes 
from (
select airline, origin_airport, destination_airport
from flights
group by airline, origin_airport, destination_airport
) airline_fact
left join airlines on airline_fact.airline = airlines.iata_code
group by airlines.airline, airlines.iata_code
order by unique_routes desc;
