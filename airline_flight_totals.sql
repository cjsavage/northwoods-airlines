
create or replace view AIRLINE_FLIGHT_TOTALS as
select airlines.airline as airline_desc
    , airlines.iata_code as airline_code
    , flights.month
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
from flights
left join airlines
    on flights.airline = airlines.iata_code
group by airlines.airline, airlines.iata_code, flights.month
order by month;
