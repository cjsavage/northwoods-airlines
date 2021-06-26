
create or replace view AIRPORT_FLIGHT_TOTALS as
select airports.airport as airline_desc
	, airports.iata_code as airline_code
    , airport_fact.month
    , case when month = 1 then 'JAN'
           when month = 2 then 'FEB'
           when month = 3 then 'MAR'
           when month = 4 then 'APR'
           when month = 5 then 'MAY'
           when month = 6 then 'JUN'
           when month = 7 then 'JUL'
           when month = 8 then 'AUG'
           when month = 9 then 'SEP'
           when month = 10 then 'OCT'
           when month = 11 then 'NOV'
           when month = 12 then 'DEC'
           else 'ERROR' END
           as month_desc
    , count(*) as flight_count
from (
    select origin_airport as airport, month from flights
    union all
    select destination_airport as airport, month from flights
) airport_fact
left join airports
    on airport_fact.airport = airports.iata_code
group by airports.airport, airports.iata_code, airport_fact.month
order by month;
