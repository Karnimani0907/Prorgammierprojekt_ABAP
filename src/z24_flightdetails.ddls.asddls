@AbapCatalog.sqlViewName: 'Z24_FLIGHTDETAI'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Details with Connection Data'
define view Z24_FlightDetails
as select from /dmo/flight as Flight
inner join /dmo/connection as Connection
on Flight.carrier_id = Connection.carrier_id
and Flight.connection_id = Connection.connection_id
inner join /dmo/airport as Airport on Airport.airport_id = Connection.airport_from_id
inner join /dmo/booking as Booking on Booking.carrier_id = Flight.carrier_id
{
Flight.carrier_id as CarrierId,
Flight.connection_id as ConnectionId,
Flight.flight_date as FlightDate,
Flight.price as Price,
Flight.currency_code as CurrencyCode,
Flight.plane_type_id as PlaneTypeId,
Flight.seats_max as SeatsMax,
Flight.seats_occupied as SeatsOccupied,
Connection.carrier_id as CarrierId_conn,
Connection.connection_id as ConnectionId_conn,
Connection.airport_from_id as AirportFromId,
Connection.airport_to_id as AirportToId,
Connection.departure_time as DepartureTime,
Connection.arrival_time as ArrivalTime,
Connection.distance as Distance,
Connection.distance_unit as DistanceUnit,
Airport.airport_id as AirportId,
Airport.name as Name,
Airport.city as City,
Airport.country as Country,
Booking.travel_id as TravelId,
Booking.booking_id as BookingId,
Booking.booking_date as BookingDate,
Booking.customer_id as CustomerId,
Booking.flight_price as FlightPrice
}
