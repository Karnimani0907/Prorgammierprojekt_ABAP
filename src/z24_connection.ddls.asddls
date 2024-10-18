/*@AbapCatalog.viewEnhancementCategory: [#NONE]
@AbapCatalog.dataMaintenance: #RESTRICTED*/
@AbapCatalog:{
  dataMaintenance: #RESTRICTED,
   viewEnhancementCategory: [#NONE]
}
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Entity)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #D,
  sizeCategory: #M,
  dataClass: #MASTER
}
define view entity Z24_Connection
 as select from /dmo/connection
{
key /dmo/connection.carrier_id as CarrierId,
key /dmo/connection.connection_id as ConnectionId,
/dmo/connection.airport_from_id as AirportFromId,
/dmo/connection.airport_to_id as AirportToId,
/dmo/connection.departure_time as DepartureTime,
/dmo/connection.arrival_time as ArrivalTime,
/dmo/connection.distance as Distance,
/dmo/connection.distance_unit as DistanceUnit
}
