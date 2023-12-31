*&---------------------------------------------------------------------*
*& Report  ZSDR_HESAP_MAKINASI
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

*bu program 3 mart 2023 tarihinde analist03 isimli kullanıcı tarafında olusturulmuştur
* Dosya adı: ZSDR_HESAP_MAKINASI
* yardımıci kaynak: https://gocoding.org/calculator-in-abap/


REPORT ZSDR_HESAP_MAKINASI.



PARAMETERS : p_inp1 TYPE int2,
             p_inp2 TYPE int2.


DATA: result TYPE i. " define variable for r

" radio button
SELECTION-SCREEN BEGIN OF BLOCK B2 WITH FRAME TITLE TEXT-002.
  PARAMETERS : Topla RADIOBUTTON GROUP RG1.
  PARAMETERS : Cikar RADIOBUTTON GROUP RG1.
  PARAMETERS : Carp RADIOBUTTON GROUP RG1.
  PARAMETERS : Bol RADIOBUTTON GROUP RG1.

SELECTION-SCREEN END OF BLOCK B2.


"push button
SELECTION-SCREEN:
      PUSHBUTTON /2(20) button1 USER-COMMAND but1.


AT SELECTION-SCREEN.
  CASE sy-ucomm.
    WHEN 'BUT1'.  " but1 is pressed
      IF p_inp1 IS NOT INITIAL AND p_inp2 IS NOT INITIAL.
        IF Topla EQ 'X'.
           result = p_inp1 + p_inp2.
        ENDIF.

         IF Cikar EQ 'X'.
           result = p_inp1 - p_inp2.
         ENDIF.

         IF Carp EQ 'X'.
           result = p_inp1 * p_inp2.
         ENDIF.

         IF Bol EQ 'X'.

           IF ( p_inp2 <> 0 ).
             result = P_inp1 / p_inp2.
           ENDIF.
         ENDIF.

        MESSAGE |Sonuç : { result }| TYPE 'I'.

     ELSE.
       MESSAGE |Lütfen input deger(ler)ini giriniz | TYPE 'I'.
     ENDIF.
  ENDCASE.


 INITIALIZATION.
  button1 = 'Hesapla'.