CLASS lhc_ZI_SoPyay_M DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_SoPyay_M RESULT result.
    METHODS earlynumbering_cba_booking FOR NUMBERING
      IMPORTING entities FOR CREATE zi_sopyay_m\_booking.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities
                  FOR CREATE ZI_SoPyay_M.
ENDCLASS.

CLASS lhc_ZI_SoPyay_M IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.


  METHOD earlynumbering_create.
    DATA(lt_entities) = entities.
    DELETE lt_entities WHERE TravelId IS NOT INITIAL.

    TRY.
        cl_numberrange_runtime=>number_get(
            EXPORTING
              nr_range_nr       = '01'
              object            = '/DMO/TRV_M'
              quantity          = CONV #( lines( lt_entities ) )
            IMPORTING
              number            = DATA(lv_latest_num)
              returncode        = DATA(lv_code)
              returned_quantity = DATA(lv_qty)
          ).
      CATCH cx_nr_object_not_found.
      CATCH cx_number_ranges INTO DATA(lo_error).
        LOOP AT lt_entities INTO DATA(ls_entities).

          APPEND VALUE #( %cid = ls_entities-%cid
                  %key = ls_entities-%key )
                  TO failed-zi_sopyay_m.
          APPEND VALUE #( %cid = ls_entities-%cid
                  %key = ls_entities-%key
                  %msg = lo_error )
                  TO reported-zi_sopyay_m.


        ENDLOOP.
        EXIT.
    ENDTRY.

    ASSERT lv_qty = lines( lt_entities ).

*    DATA: lt_zi_sopyay_m TYPE TABLE FOR MAPPED EARLY zi_sopyay_m,
*          ls_zi_sopyay_m LIKE LINE OF lt_zi_sopyay_m.
    DATA(lv_curr_num) = lv_latest_num - lv_qty.


    LOOP AT lt_entities INTO ls_entities.

      lv_curr_num = lv_curr_num + 1.

*      ls_zi_sopyay_m = VALUE #( %cid = ls_entities-%cid
*                                   TravelId = lv_curr_num
*                                   ) .
*    APPEND ls_zi_sopyay_m to mapped-zi_sopyay_m.

      APPEND VALUE #( %cid = ls_entities-%cid
                      TravelId = lv_curr_num )
                      TO mapped-zi_sopyay_m.

    ENDLOOP.

  ENDMETHOD.
  METHOD earlynumbering_cba_Booking.
  ENDMETHOD.

ENDCLASS.
