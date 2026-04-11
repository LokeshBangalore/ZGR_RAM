@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view on Booking Supplement'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZC_GR_BOOKSUPPL_M
  as projection on ZI_GR_BOOKSUPPL_M
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,

      SupplementId,
      _SupplementText.Description as SupplmentDescription : localized,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,

      CurrencyCode,

      LastChangedAt,

      /* Associations */
      _booking,
      _product,
      _SupplementText,
      _travel

}
