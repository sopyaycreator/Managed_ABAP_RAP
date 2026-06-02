@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Projection'
define view entity ZC_BOOKING_SoPyay_M
  as projection on ZI_BOOKING_SoPyay_M
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _Booking_Status,
      _BookSuppl : redirected to composition child ZC_BOOKSUPPL_SoPyay_M,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ZC_Travel_SoPyay_M
}
