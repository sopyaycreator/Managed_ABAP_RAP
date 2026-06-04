@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supp Projection View Managed'
@Metadata.allowExtensions: true
define view entity ZC_BOOKSUPPL_SoPyay_M
  as projection on ZI_BOOKSUP_SoPyay_M
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      @ObjectModel.text.element: ['SupplementDesc']
      SupplementId,
      _SupplementText.Description as SupplementDesc : localized,
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Travel  : redirected to ZC_Travel_SoPyay_M,
      _Booking : redirected to parent ZC_BOOKING_SoPyay_M,
      _Supplement,
      _SupplementText
}
