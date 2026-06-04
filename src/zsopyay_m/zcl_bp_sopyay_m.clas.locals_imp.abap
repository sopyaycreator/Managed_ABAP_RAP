CLASS lhc_ZI_SoPyay_M DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_SoPyay_M RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities
      FOR CREATE ZI_SoPyay_M.
ENDCLASS.

CLASS lhc_ZI_SoPyay_M IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.


  METHOD earlynumbering_create.
  ENDMETHOD.
ENDCLASS.
