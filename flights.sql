create table flights (
YEAR Number COMMENT 'Year of the flight',
MONTH Number COMMENT 'The month of the flight',
DAY Number COMMENT 'The day of the flight',
DAY_OF_WEEK Number COMMENT 'Day of the week of the flight',
AIRLINE String COMMENT 'Airline identifier',
FLIGHT_NUMBER String COMMENT 'Flight identifier',
TAIL_NUMBER String COMMENT 'Aircraft identifier',
ORIGIN_AIRPORT String COMMENT 'Starting airport',
DESTINATION_AIRPORT String COMMENT 'Destination airport',
SCHEDULED_DEPARTURE String COMMENT 'Planned departure time',
DEPARTURE_TIME String COMMENT 'Wheels up time',
DEPARTURE_DELAY Number COMMENT 'Total delay on departure',
TAXI_OUT Number COMMENT 'The time duration elapsed between departure from the origin airport gate and wheels off',
WHEELS_OFF String COMMENT 'The time point that the aircraft wheels leave the ground',
SCHEDULED_TIME Number COMMENT 'Planned time amount needed for the flight trip',
AIR_TIME Number COMMENT 'The time duration between wheels_off and wheels_on time',
DISTANCE Number COMMENT 'The distance between two airports',
WHEELS_ON Number COMMENT 'The time point that the aircraft wheels touch on the ground',
TAXI_IN Number COMMENT 'The time duration elapsed between wheels-on and gate arrival at the destination airport',
SCHEDULED_ARRIVAL Number COMMENT 'Planned arrival time',
ARRIVAL_TIME String COMMENT 'Time of arrival',
ARRIVAL_DELAY String COMMENT 'Arrival time - Scheduled Arrival',
DIVERTED Number COMMENT 'Aircraft was diverted',
CANCELLED Number COMMENT 'Aircraft was canceled',
CANCELLATION_REASON String COMMENT 'Reason for Cancellation of flight: A - Airline/Carrier; B - Weather; C - National Air System; D - Security',
AIR_SYSTEM_DELAY Number COMMENT 'Delay caused by the air system',
SECURITY_DELAY Number COMMENT 'Delay caused by security',
AIRLINE_DELAY Number COMMENT 'Delay caused by the airline',
LATE_AIRCRAFT_DELAY Number COMMENT 'Delay caused by the aircraft',
WEATHER_DELAY Number COMMENT 'Delay caused by weather'
);
