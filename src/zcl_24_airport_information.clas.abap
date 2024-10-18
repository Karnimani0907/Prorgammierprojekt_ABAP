CLASS zcl_24_airport_information DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
METHODS statistic
IMPORTING
city TYPE /dmo/city
country TYPE /dmo/airport_name
airport_id TYPE /dmo/airport_id
RETURNING
VALUE(result) TYPE string.

  PROTECTED SECTION.


  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_24_airport_information IMPLEMENTATION.
  METHOD statistic.
    DATA flight_date TYPE /dmo/flight_date.
    flight_date = '20240101'.
    DATA date_end TYPE /dmo/flight_date.
    date_end = '20250101'.


    SELECT
*           COUNT( con~airport_from_id ) AS number_of_airports,
           COUNT( con~airport_to_id ) AS number_of_city
      FROM /dmo/flight AS fl
             JOIN
               /dmo/connection AS con ON fl~connection_id = con~connection_id AND fl~carrier_id = con~carrier_id
                 JOIN
                   /dmo/airport AS air ON con~airport_from_id = air~airport_id
*      FIELDS
*      fl~flight_date,
*      plane_type_id,
*      air~city,
*      con~airport_to_id,
*      con~airport_from_id
      WHERE fl~flight_date BETWEEN @flight_date AND @date_end AND air~city = @city

      INTO @DATA(countCity).

    SELECT COUNT( con~airport_to_id ) AS number
      FROM /dmo/flight AS fl
             JOIN
               /dmo/connection AS con ON fl~connection_id = con~connection_id AND fl~carrier_id = con~carrier_id
                 JOIN
                   /dmo/airport AS air ON con~airport_from_id = air~airport_id
      WHERE fl~flight_date BETWEEN @flight_date AND @date_end AND @country = air~country

      INTO @DATA(countryAirport).

    SELECT COUNT( con~airport_to_id ) AS number
      FROM /dmo/flight AS fl
             JOIN
               /dmo/connection AS con ON fl~connection_id = con~connection_id AND fl~carrier_id = con~carrier_id
                 JOIN
                   /dmo/airport AS air ON con~airport_from_id = air~airport_id
      WHERE fl~flight_date BETWEEN @flight_date AND @date_end AND @airport_id = air~airport_id

      INTO @DATA(idAirport).

    SELECT
*           COUNT( con~airport_from_id ) AS number_of_airports,
           COUNT( con~airport_From_id ) AS number_of_city
      FROM /dmo/flight AS fl
             JOIN
               /dmo/connection AS con ON fl~connection_id = con~connection_id AND fl~carrier_id = con~carrier_id
                 JOIN
                   /dmo/airport AS air ON con~airport_from_id = air~airport_id
*
      WHERE fl~flight_date BETWEEN @flight_date AND @date_end AND air~city = @city

      INTO @DATA(countCity2).

    SELECT COUNT( con~airport_From_id ) AS number
      FROM /dmo/flight AS fl
             JOIN
               /dmo/connection AS con ON fl~connection_id = con~connection_id AND fl~carrier_id = con~carrier_id
                 JOIN
                   /dmo/airport AS air ON con~airport_from_id = air~airport_id
      WHERE fl~flight_date BETWEEN @flight_date AND @date_end AND @country = air~country

      INTO @DATA(countryAirport2).

    SELECT COUNT( con~airport_From_id ) AS number
      FROM /dmo/flight AS fl
             JOIN
               /dmo/connection AS con ON fl~connection_id = con~connection_id AND fl~carrier_id = con~carrier_id
                 JOIN
                   /dmo/airport AS air ON con~airport_from_id = air~airport_id
      WHERE fl~flight_date BETWEEN @flight_date AND @date_end AND @airport_id = air~airport_id

      INTO @DATA(idAirport2).

    DATA totalCity TYPE i.
    totalCity = countCity + countCity2.
    DATA totalAirport TYPE i.
    totalAirport = countryAirport + countryairport2.
    DATA totalIdAirport TYPE i.
    totalIdAirport = idAirport + idAirport2.
    " TODO: variable is assigned but never used (ABAP cleaner)

    result = |\nAnzahl wie oft { city } angeflogen wurde: { totalCity } mal pro Jahr\nAnzahl wie oft { country } angeflogen wurde: { totalairport } mal pro Jahr\nAnzahl wie oft { airport_id } angeflogen wurde: { totalIdAirport } mal pro Jahr\n|.
  ENDMETHOD.
ENDCLASS.
