@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for Booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_GR_BOOKING
  as projection on ZI_GR_BOOKING
{
  key TravelId,
  key BookingId,
  
      BookingDate,
  
      CustomerId,
  
      CustomerName,
  
      CarrierId,
  
      CarrierName,
  
      ConnectionId,
      FlightDate,
  
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      
      CurrencyCode,
      
      BookingStatus,
      BookingStatusText,
      
      LastChangedAt,

      /* Associations */
      _BookSupplement,
      _carrier,
      _customer,
      _statustext,
      _travel : redirected to parent ZC_GR_TRAVEL_M
}
