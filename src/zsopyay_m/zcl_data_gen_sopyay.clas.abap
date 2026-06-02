CLASS zcl_data_gen_sopyay DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_data_gen_sopyay IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    " 1. Clear your custom tables first
    DELETE FROM zsopyay_m.
    DELETE FROM zbooking_sopyaym.
    DELETE FROM zbooksuppl_sopym.
    COMMIT WORK.

    " 2. Copy Travel Data into your table
    INSERT zsopyay_m FROM (
      SELECT *
        FROM /dmo/travel

    )
    .COMMIT WORK.

    out->write( |\n { sy-dbcnt } travel entries inserted into your tables.| ).

    " 3. Copy Booking Data into table
    INSERT zbooking_sopyaym FROM (
      SELECT *
        FROM /dmo/booking

    ).
    COMMIT WORK.

    " 4. Copy Booking Supplement Data into your table
    INSERT zbooksuppl_sopym FROM (
      SELECT *
        FROM /dmo/book_suppl

    ).
    COMMIT WORK.

    out->write( 'Data generation completed successfully!' ).

  ENDMETHOD.
ENDCLASS.
