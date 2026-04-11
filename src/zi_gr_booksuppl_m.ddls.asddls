@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for Booking Supplements'
@Metadata.ignorePropagatedAnnotations: true


define view entity ZI_GR_BOOKSUPPL_M
  as select from zgr_booksuppl_m

  association        to parent ZI_GR_BOOKING  as _booking        on  $projection.TravelId  = _booking.TravelId
                                                                 and $projection.BookingId = _booking.BookingId
  association [1..1] to ZI_GR_TRAVEL_M        as _travel         on  $projection.TravelId = _travel.TravelId
  association [1..1] to /DMO/I_Supplement     as _product        on  $projection.BookingSupplementId = _product.SupplementID
  association [1..*] to /DMO/I_SupplementText as _SupplementText on  $projection.SupplementId = _SupplementText.SupplementID

{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at       as LastChangedAt,

      //Association
      _booking,
      _travel,
      _product,
      _SupplementText

}
