@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection View'
@Metadata.allowExtensions: true
define root view entity ZC_Travel_SoPyay_M
  provider contract transactional_query
  as projection on ZI_SoPyay_M
{
  key TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]

      AgencyId,
      _Agency.Name       as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      @ObjectModel.text.element: [ 'OverallStatusText' ]

      OverallStatus,
      _Status._Text.Text as OverallStatusText : localized,
      //CreatedAt,
      //LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZC_BOOKING_SoPyay_M,
      _Currency,
      _Customer,
      _Status
}
