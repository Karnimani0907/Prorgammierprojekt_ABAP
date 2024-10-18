CLASS zcl_24_execute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_24_execute IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Erstelle eine Instanzen
    DATA(lo_telefonabgleich) = NEW zcl_24_telefonabgleich( ).
    DATA(lo_airport_information) = NEW zcl_24_airport_information( ).
    DATA(lo_last_minute) = NEW zcl_24_last_minute( ).
    DATA(lo_select) = NEW zcl_24_test_select( ).
    " Definiere die benötigten Parameter
    " Aufgabe1
    DATA iv_bookingId  TYPE /dmo/booking_id    VALUE '0001'.
    DATA iv_flightDate TYPE /dmo/flight_date   VALUE '20250528'.
    DATA connectionID1 TYPE /dmo/connection_id VALUE '0001'.
    DATA carrier_id2    TYPE /DMO/carrier_id    VALUE 'SQ'.
    " Aufgabe 2
    DATA flight_date   TYPE /DMO/flight_date   VALUE '20250601'.
    DATA carrier_id    TYPE /DMO/carrier_id    VALUE 'AA'.
    DATA connection_id TYPE /DMO/connection_id VALUE '322'.
    " Aufgabe 3
    DATA iv_today      TYPE /dmo/flight_date   VALUE '20240801'.
    DATA iv_today_end  TYPE /dmo/flight_date   VALUE '20240901'.
    " Aufgabe 4
    DATA iv_city       TYPE /dmo/city          VALUE 'Singapore'.
    DATA iv_country    TYPE /dmo/airport_name  VALUE 'DE'.
    DATA iv_airport_id TYPE /dmo/airport_id    VALUE 'SIN'.

    " Rufe die Methode perform_abgleich auf und speichere das Ergebnis
    DATA(result1) = lo_select->Aufgabe1( bookingId    = iv_bookingId
                                         flightDate   = iv_flightDate
                                         connectionId = connectionID1
                                          carrierId = carrier_id2 ).
    DATA(result2) = lo_telefonabgleich->perform_abgleich( iv_flight_date   = flight_date
                                                          iv_carrier_id    = carrier_id
                                                          iv_connection_id = connection_id ).
    DATA(result3) = lo_last_minute->last_minute( today     = iv_today
                                                 today_end = iv_today_end ).

    DATA(result4) = lo_airport_information->statistic( city       = iv_city
                                                       country    = iv_country
                                                       airport_id = iv_airport_id ).

    " Ausgabe des Ergebnisses auf der Konsole
    out->write( |Aufgabe 1:\n| ).
    out->write( result1[ 1 ] ).
    out->write( '------------------------------------------------------------------------------------------' ).
    out->write( |Aufgabe 2:| ).
    out->write( result2 ).
    out->write( '------------------------------------------------------------------------------------------' ).
    out->write( |Aufgabe 3:\n| ).
    out->write( result3 ).
    out->write( |\nAufgabe 4:| ).
    out->write( result4 ).
  ENDMETHOD.
ENDCLASS.
