CLASS zGR_travel_data_copy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.

ENDCLASS.



CLASS zGR_travel_data_copy IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_travel    TYPE STANDARD TABLE OF /dmo/travel_m,
          lt_booking   TYPE STANDARD TABLE OF /dmo/booking_m,
          lt_booksuppl TYPE STANDARD TABLE OF /dmo/booksuppl_m.

    DATA: lv_count TYPE i.

    " Delete all data from Travel and copy all entries from /DMO
    DELETE FROM zgr_travel_m.
    COMMIT WORK.
    SELECT COUNT( * )
      FROM zgr_travel_M
      INTO @lv_count.
    out->write( |Confirm is ZGR_TRAVEL_M initial- { lv_count } | ).

    SELECT * FROM /dmo/travel_m
      INTO TABLE @lt_travel.

    IF sy-subrc EQ 0.
      out->write( |# lines selected from /DMO/TRAVEL_M - { lines( lt_travel ) } | ).

      INSERT zgr_travel_m FROM TABLE @lt_travel.
      SELECT COUNT( * )
        FROM zgr_travel_M
        INTO @lv_count.
      out->write( |# lines inserted into ZGR_TRAVEL_M - { lv_count } | ).
    ENDIF.

    " Delete all data from Booking and copy all entries from /DMO
    DELETE FROM zgr_booking_m.
    COMMIT WORK.
    SELECT COUNT( * )
      FROM zgr_booking_m
      INTO @lv_count.
    out->write( |Confirm is ZGR_BOOKING_M initial- { lv_count } | ).

    SELECT * FROM /dmo/booking_m
      INTO TABLE @lt_booking.

    IF sy-subrc EQ 0.
      out->write( |# lines selected from /DMO/BOOKING_M - { lines( lt_booking ) } | ).

      INSERT zgr_booking_m FROM TABLE @lt_booking.
      SELECT COUNT( * )
        FROM zgr_booking_m
        INTO @lv_count.
      out->write( |# lines inserted into ZGR_BOOKING_M - { lv_count } | ).
    ENDIF.

    " Delete all data from Booking Supplements and copy all entries from /DMO
    DELETE FROM zgr_booksuppl_m.
    COMMIT WORK.
    SELECT COUNT( * )
      FROM zgr_booksuppl_m
      INTO @lv_count.
    out->write( |Confirm is ZGR_BOOKSUPPL_M initial- { lv_count } | ).

    SELECT * FROM /dmo/booksuppl_m
      INTO TABLE @lt_booksuppl.

    IF sy-subrc EQ 0.
      out->write( |# lines selected from /DMO/BOOKSUPPL_M - { lines( lt_booksuppl ) } | ).

      INSERT zgr_booksuppl_m FROM TABLE @lt_booksuppl.
      SELECT COUNT( * )
        FROM zgr_booksuppl_m
        INTO @lv_count.
      out->write( |# lines inserted into ZGR_BOOKSUPPL_M - { lv_count } | ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
