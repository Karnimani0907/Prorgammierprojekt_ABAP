CLASS zcl_24_test_select DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
TYPES:
ty_flight_info TYPE z024_strucinfo2,
ty_flight_info_tab TYPE STANDARD TABLE OF ty_flight_info WITH EMPTY KEY.

METHODS:
Aufgabe1
IMPORTING
bookingId TYPE /dmo/booking_id
flightDate TYPE /dmo/flight_date
connectionId TYPE /dmo/connection_id
carrierId type /dmo/carrier_id
RETURNING
VALUE(result) TYPE ty_flight_info_tab.
PROTECTED SECTION.
PRIVATE SECTION.
ENDCLASS.


CLASS zcl_24_test_select IMPLEMENTATION.

  METHOD Aufgabe1.

*data bookingId type /dmo/booking_id.
*bookingId = 0001.
*data flightDate type /dmo/flight_date.
*flightDate = '20250528'.
*data connectionId type /dmo/connection_id.
*connectionId = 0001.
    SELECT
    FROM Z24_FlightDetails
    FIELDS
    ArrivalTime,
    DepartureTime,
    Distance,
    Name,
    BookingId,
    FlightDate,
    CarrierId
    WHERE bookingId = @bookingId and flightDate = @FlightDate and connectionId = @connectionid and carrierid = @carrierId
    INTO Table @DATA(x).

   result = x.


  ENDMETHOD.
ENDCLASS.
