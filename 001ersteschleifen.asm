; BasicUpstart2(start)      // <- This creates a basic sys line that can start your program

;----------------------------------------------------------
;----------------------------------------------------------
;          krautguys 0001. Testprogramm
;----------------------------------------------------------
;----------------------------------------------------------
;     * = $4000 "Main Program"    // <- The name 'Main program' will appear in the memory map when assembling
*=$0801
!byte $0c,$08,$e2,$07,$9e,$20,$32,$30,$36,$32,$00,$00,$00



 
            lda #$00
            sta $d020                       ; Farbe des Bildschirms auf 0 setzen
            sta $d021                       ; Hintergrundfarbe des Bildschirms auf 0 setzen
            lda #147                        ; Steuerzeichen für Bildschirm löschen
            jsr $ffd2                       ; Löschen durchführen

           ; ZEIL=0
            TEXTFARBE=149              ; Steuerzeichen für Textfarbe
            ;ZEILE=2                    ; Zeilenvariable
            ldx #0
            stx $02                         ; schleifenzähler
            
loop        ;ZEILE+1                         ; Zeile um 1 erhöhen
            ;ZEIL=+1
            inc $02                             
            ldx $02
            ldy #8                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda $02                         
            adc #48                         ; Nummerierung ausgeben
            jsr $ffd2                       ; Zeichen setzen

     ;      ldx #zeile                      ; Zeile setzen
            ldy #10                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #75                         ; K
            jsr $ffd2                       ; Zeichen setzen

      ;     ldx #zeile                      ; Zeile setzen
            ldy #11                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #82                         ; R
            jsr $ffd2                       ; Zeichen setzen

      ;     ldx #zeile                      ; Zeile setzen
            ldy #12                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #65                         ; A
            jsr $ffd2                       ; Zeichen setzen

       ;    ldx #zeile                      ; Zeile setzen
            ldy #13                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #85                         ; U
            jsr $ffd2                       ; Zeichen setzen

      ;     ldx #zeile                      ; Zeile setzen
            ldy #14                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #84                         ; T
            jsr $ffd2                       ; Zeichen setzen

     ;      ldx #zeile                      ; Zeile setzen
            ldy #15                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #71                         ; G
            jsr $ffd2                       ; Zeichen setzen

    ;       ldx #zeile                      ; Zeile setzen
            ldy #16                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #85                         ; U
            jsr $ffd2                       ; Zeichen setzen

   ;        ldx #zeile                      ; Zeile setzen
            ldy #17                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #89                         ; Y
            jsr $ffd2                       ; Zeichen setzen

            lda $02                         
            adc #148                        ; Steuerzeichen Textfarbe 
            jsr $ffd2 
   ;        .eval z++                       ; zähler erhöhen
   ;        .eval textfarbe=textfarbe+1     ; textfarbe weiterschalten
            lda $02
            cmp #9
            beq ende
            jmp loop                        ; hier bedingter Sprung



ende     
             
        cli
        jmp *
;----------------------------------------------------------
