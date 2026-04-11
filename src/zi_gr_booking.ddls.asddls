@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for Booking DB'

@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_GR_BOOKING
  as select from zgr_booking_m
  association        to parent ZI_GR_TRAVEL_M         as _travel     on  $projection.TravelId = _travel.TravelId
  composition of ZI_GR_BOOKSUPPL_M                    as _BookSupplement

  association [1..1] to /DMO/I_Customer               as _customer   on  $projection.CustomerId = _customer.CustomerID
  association [1..1] to /DMO/I_Carrier                as _carrier    on  $projection.CarrierId = _carrier.AirlineID
  association [1..1] to /DMO/I_Connection             as _connection on  $projection.CarrierId    = _connection.AirlineID
                                                                     and $projection.ConnectionId = _connection.ConnectionID
  association [1..1] to /DMO/I_Booking_Status_VH_Text as _statustext on  $projection.BookingStatus = _statustext.BookingStatus

{
  key travel_id          as TravelId,
  key booking_id         as BookingId,

      booking_date       as BookingDate,
      customer_id        as CustomerId,
      _customer.LastName as CustomerName,

      carrier_id         as CarrierId,
      _carrier.Name      as CarrierName,

      connection_id      as ConnectionId,
      flight_date        as FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price       as FlightPrice,

      currency_code      as CurrencyCode,
      booking_status     as BookingStatus,
      @Semantics.language: true
      _statustext.Text   as BookingStatusText,

      last_changed_at    as LastChangedAt,

      //Asscoiations
      _travel,
      _customer,
      _carrier,
      _statustext,
      _BookSupplement

}
