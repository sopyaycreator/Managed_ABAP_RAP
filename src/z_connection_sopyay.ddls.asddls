@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection View CDS Data Model'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo: {
    typeName: 'Connection',
    typeNamePlural: 'Connections'

}
@Search.searchable: true
define view entity Z_Connection_SOPYAY
  as select from /dmo/connection as Connection
  association [1..*] to ZI_Flight_SoPyay_R  as _Flight  on  $projection.CarrierId    = _Flight.CarrierId
                                                        and $projection.ConnectionId = _Flight.ConnectionId

  association [1]    to ZI_Carrier_SoPyay_R as _Airline on  $projection.CarrierId = _Airline.CarrierId
{
      @UI.facet: [{
                  id:'Connection',
                  purpose:#STANDARD,
                  type: #IDENTIFICATION_REFERENCE,
                  position: 10,label: 'Connection Detail'},

                  {
                  id: 'Flight',
                  purpose:#STANDARD,
                  type:#LINEITEM_REFERENCE,
                  position: 20,label: 'Flights'

                  ,targetElement: '_Flight'
                  }]


      @UI.lineItem: [{ position: 10 ,label: 'Airline' }]
      @UI.identification: [{ position: 10 ,label: 'Airline'}]
      @ObjectModel.text.association: '_Airline'
      @Search.defaultSearchElement: true
  key carrier_id      as CarrierId,
      @UI.lineItem: [{ position: 20  }]
      @UI.identification: [{ position: 20 }]
      @Search.defaultSearchElement: true
  key connection_id   as ConnectionId,
      @UI.selectionField: [{ position:10}]
      @UI.lineItem: [{ position: 30, label: 'Departure Airport ID'  }]
      @UI.identification: [{ position: 30 ,label: 'Departure Airport ID'}]
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity:{
      name: 'ZI_Airport_Sopyay_VH',
      element: 'AirportId'}}]
      airport_from_id as AirportFromId,
      @UI.selectionField: [{ position:20 }]
      @UI.lineItem: [{ position: 40  }]
      @UI.identification: [{ position: 40 }]
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity:{
      name: 'ZI_Airport_Sopyay_VH',
      element: 'AirportId'}}]
      @EndUserText.label: 'Destination Airport ID'
      airport_to_id   as AirportToId,
      @UI.lineItem: [{ position: 50 ,label: 'Departure Time'}]
      @UI.identification: [{ position: 50 }]
      departure_time  as DepartureTime,
      @UI.lineItem: [{ position: 60, label: 'Arrival Time'  }]
      @UI.identification: [{ position: 60 }]
      arrival_time    as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit' @UI.identification: [{ position: 70 }]

      distance        as Distance,
      distance_unit   as DistanceUnit,
      //Associatioin ---
      @Search.defaultSearchElement: true
      _Flight,
      @Search.defaultSearchElement: true
      _Airline
}
