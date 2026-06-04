@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Projection'
@Metadata.allowExtensions: true
define view entity ZC_BOOKING_SoPyay_M
  as projection on ZI_BOOKING_SoPyay_M
{
  key TravelId,
  key BookingId,
      BookingDate,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.LastName         as CustomerName,
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierId,
      _Carrier.Name              as CarrierName,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      @ObjectModel.text.element: [ 'BookingStatusText' ]
      BookingStatus,
      _Booking_Status._Text.Text as BookingStatusText : localized,
      LastChangedAt,
      /* Associations */
      _Booking_Status,
      _BookSuppl : redirected to composition child ZC_BOOKSUPPL_SoPyay_M,
      _Carrier,
      _Connection,
      _Customer,
      _Travel    : redirected to parent ZC_Travel_SoPyay_M
}
