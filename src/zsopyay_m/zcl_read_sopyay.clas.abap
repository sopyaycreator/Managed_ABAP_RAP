CLASS zcl_read_sopyay DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_read_sopyay IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    READ ENTITY ZI_SoPyay_M
*    FROM VALUE #( ( %key-TravelId = '0000004144'
*                    %control = VALUE #( AgencyId = if_abap_behv=>mk-on
*                    customerid = if_abap_behv=>mk-on
*                    begindate = if_abap_behv=>mk-on )
*
*    )
*                 )
*    RESULT DATA(lt_result_short)
*    FAILED DATA(lt_failed_short).
*
*    IF lt_failed_short IS NOT INITIAL.
*      out->write( 'Read Failed' ).
*
*    ELSE.
*      out->write( lt_result_short ).
*    ENDIF.

    READ ENTITY ZI_SoPyay_M
    FIELDS ( AgencyId CreatedAt CustomerId )
    WITH VALUE #( ( %key-TravelId = '0000004144' )
                 )
    RESULT DATA(lt_result_short)
    FAILED DATA(lt_failed_short).

    IF lt_failed_short IS NOT INITIAL.
      out->write( 'Read Failed' ).

    ELSE.
      out->write( lt_result_short ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
