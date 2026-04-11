@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for Travel'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true

define root view entity ZC_GR_TRAVEL_M
  provider contract transactional_query
  as projection on ZI_GR_TRAVEL_M
{
  key TravelId,

      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId,
      _agency.Name       as AgencyName,

      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _customer.LastName as CustomerName,

      BeginDate,
      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      @DefaultAggregation: #SUM
      TotalPrice,

      CurrencyCode,
      
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      OverallStatus,
      _status._Text.Text as OverallStatusText : localized,


      Description,
      LastChangedAt,

      //      CreatedBy,
      //      CreatedAt,
      //      LastChangedBy,

      /* Associations */
      _agency,
      _booking : redirected to composition child ZC_GR_BOOKING,
      _currency,
      _customer,
      _status
}
