CLASS zcl_24_telefonabgleich DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
METHODS perform_abgleich
IMPORTING
iv_flight_date TYPE /dmo/flight_date
iv_carrier_id TYPE /dmo/carrier_id
iv_connection_id TYPE /dmo/connection_id
RETURNING
VALUE(rv_result) TYPE string .

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_24_telefonabgleich IMPLEMENTATION.


  METHOD perform_abgleich.



    SELECT SINGLE FROM /DMO/Booking as b
    Join /DMO/FLIGHT as fl on b~carrier_id = fl~carrier_id AND b~connection_id = fl~connection_id AND b~flight_date = fl~flight_date
    FIELDS
    fl~carrier_id,
    fl~client,
    fl~connection_id,
    fl~flight_date,
    fl~plane_type_id,
    fl~price,
    fl~currency_code
    WHERE fl~flight_date = @iv_flight_date
    AND fl~carrier_id = @iv_carrier_id
    AND fl~connection_id = @iv_connection_id
    AND b~flight_date = @iv_flight_date
    AND b~carrier_id = @iv_carrier_id
    AND b~connection_id = @iv_connection_id

    INTO @DATA(result).

  IF result IS INITIAL.
rv_result = 'existiert nicht'.
ELSE.
rv_result = |\nCarrier: { result-carrier_id }, Client: { result-client }, Connection: { result-connection_id }, Flight Date: { result-flight_date }, Plane Type: { result-plane_type_id }, Price: { result-price }, Currency: { result-currency_code }\n|.
ENDIF.

  ENDMETHOD.
ENDCLASS.
