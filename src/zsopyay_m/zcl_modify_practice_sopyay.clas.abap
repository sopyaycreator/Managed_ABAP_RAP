CLASS zcl_modify_practice_sopyay DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_modify_practice_sopyay IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA : lt_book TYPE TABLE FOR CREATE ZI_SoPyay_M\_Booking.
    MODIFY ENTITY ZI_SoPyay_M
    CREATE FROM VALUE #(
                (
                %cid = 'cid1'
                %data-BeginDate = '20260515'
                %control-BeginDate = if_abap_behv=>mk-on

     ) )
CREATE BY \_Booking
FROM VALUE #( ( %cid_ref = 'cid1'
            %target = VALUE #( ( %cid = 'cid11'
                                    %data-bookingdate = '20260515'
                                    %control-Bookingdate = if_abap_behv=>mk-on

            ) )


            ) )

     FAILED FINAL(it_failed)
     MAPPED FINAL(it_mapped)
     REPORTED FINAL(it_result)
     .
    IF it_failed IS NOT INITIAL.
      out->write( it_failed ).
    ELSE.
      COMMIT ENTITIES.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
