@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Test'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z24_FlightTable 
as select from /dmo/flight
association [1..1] to Z24_Connection as _Connection on 
$projection.CarrierId = _Connection.CarrierId and 
$projection.ConnectionId = _Connection.ConnectionId

{
key carrier_id as CarrierId,
key connection_id as ConnectionId,
key flight_date as FlightDate,
@Semantics.amount.currencyCode: 'CurrencyCode'
price as Price,
currency_code as CurrencyCode,
plane_type_id as PlaneTypeId,
seats_max as SeatsMax,
seats_occupied as SeatsOccupied,
_Connection
}
