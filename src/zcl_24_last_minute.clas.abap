CLASS zcl_24_last_minute DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

TYPES: ty_flight_info TYPE z08_strucinfo,
ty_flight_info_tab TYPE STANDARD TABLE OF ty_flight_info WITH EMPTY KEY.

METHODS last_minute
IMPORTING
today TYPE /dmo/flight_date
today_end TYPE /dmo/flight_date
RETURNING
VALUE(result) TYPE ty_flight_info_tab.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_24_last_minute IMPLEMENTATION.
  METHOD last_minute.
*    DATA today     TYPE /dmo/flight_date VALUE '20240801'.
*    DATA today_end TYPE /dmo/flight_date VALUE '20240901'.



    SELECT
      FROM /dmo/flight AS fl
             LEFT JOIN
               /dmo/connection AS con ON fl~connection_id = con~connection_id AND fl~carrier_id = con~carrier_id
                 LEFT JOIN
                   /dmo/airport AS air ON con~airport_from_id = air~airport_id
      FIELDS fl~flight_date,
*             fl~price,
             con~departure_time,
             con~arrival_time,
             con~distance,
             air~name,
             air~city,
             air~country
      WHERE fl~flight_date BETWEEN @today AND @today_end AND fl~seats_max > fl~seats_occupied
      INTO TABLE @DATA(x).

    result = x .

  ENDMETHOD.
ENDCLASS.
