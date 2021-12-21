; BasicUpstart2(start)      // <- This creates a basic sys line that can start your program

;----------------------------------------------------------
;----------------------------------------------------------
;          krautguys 0002. Testprogramm
;----------------------------------------------------------
;----------------------------------------------------------
;     * = $4000 "Main Program"    // <- The name 'Main program' will appear in the memory map when assembling

;*******************************************************************************
;*** Farben                                                                  ***
;*******************************************************************************
COLOR_BLACK         = $00           ;schwarz
COLOR_WHITE         = $01           ;weiß
COLOR_RED           = $02           ;rot
COLOR_CYAN          = $03           ;türkis
COLOR_PURPLE        = $04           ;lila
COLOR_GREEN         = $05           ;grün
COLOR_BLUE          = $06           ;blau
COLOR_YELLOW        = $07           ;gelb
COLOR_ORANGE        = $08           ;orange
COLOR_BROWN         = $09           ;braun
COLOR_PINK          = $0a           ;rosa
COLOR_DARKGREY      = $0b           ;dunkelgrau
COLOR_GREY          = $0c           ;grau
COLOR_LIGHTGREEN    = $0d           ;hellgrün
COLOR_LIGHTBLUE     = $0e           ;hellblau
COLOR_LIGHTGREY     = $0f           ;hellgrau
 
;*******************************************************************************
;*** Die VIC II Register  -  ANFANG                                          ***
;*******************************************************************************
VICBASE             = $d000         ;(RG) = Register-Nr.
SPRITE0X            = $d000         ;(00) X-Position von Sprite 0
SPRITE0Y            = $d001         ;(01) Y-Position von Sprite 0
SPRITE1X            = $d002         ;(02) X-Position von Sprite 1
SPRITE1Y            = $d003         ;(03) Y-Position von Sprite 1
SPRITE2X            = $d004         ;(04) X-Position von Sprite 2
SPRITE2Y            = $d005         ;(05) Y-Position von Sprite 2
SPRITE3X            = $d006         ;(06) X-Position von Sprite 3
SPRITE3Y            = $d007         ;(07) Y-Position von Sprite 3
SPRITE4X            = $d008         ;(08) X-Position von Sprite 4
SPRITE4Y            = $d009         ;(09) Y-Position von Sprite 4
SPRITE5X            = $d00a         ;(10) X-Position von Sprite 5
SPRITE5Y            = $d00b         ;(11) Y-Position von Sprite 5
SPRITE6X            = $d00c         ;(12) X-Position von Sprite 6
SPRITE6Y            = $d00d         ;(13) Y-Position von Sprite 6
SPRITE7X            = $d00e         ;(14) X-Position von Sprite 7
SPRITE7Y            = $d00f         ;(15) Y-Position von Sprite 7
SPRITESMAXX         = $d010         ;(16) Höhstes BIT der jeweiligen X-Position
                                    ;        da der BS 320 Punkte breit ist reicht
                                    ;        ein BYTE für die X-Position nicht aus!
                                    ;        Daher wird hier das 9. Bit der X-Pos
                                    ;        gespeichert. BIT-Nr. (0-7) = Sprite-Nr.
SPRITEACTIV         = $d015         ;(21) Bestimmt welche Sprites sichtbar sind
                                    ;        Bit-Nr. = Sprite-Nr.
SPRITEDOUBLEHEIGHT  = $d017         ;(23) Doppelte Höhe der Sprites
                                    ;        Bit-Nr. = Sprite-Nr.
SPRITEDEEP          = $d01b         ;(27) Legt fest ob ein Sprite vor oder hinter
                                    ;        dem Hintergrund erscheinen soll.
                                    ;        Bit = 1: Hintergrund vor dem Sprite
                                    ;        Bit-Nr. = Sprite-Nr.
SPRITEMULTICOLOR    = $d01c         ;(28) Bit = 1: Multicolor Sprite 
                                    ;        Bit-Nr. = Sprite-Nr.
SPRITEDOUBLEWIDTH   = $d01d         ;(29) Bit = 1: Doppelte Breite des Sprites
                                    ;        Bit-Nr. = Sprite-Nr.
SPRITESPRITECOLL    = $d01e         ;(30) Bit = 1: Kollision zweier Sprites
                                    ;        Bit-Nr. = Sprite-Nr.
                                    ;        Der Inhalt wird beim Lesen gelöscht!!
SPRITEBACKGROUNDCOLL= $d01f         ;(31) Bit = 1: Sprite / Hintergrund Kollision
                                    ;        Bit-Nr. = Sprite-Nr.
                                    ;        Der Inhalt wird beim Lesen gelöscht!
SPRITEMULTICOLOR0   = $d025         ;(37) Spritefarbe 0 im Multicolormodus
SPRITEMULTICOLOR1   = $d026         ;(38) Spritefarbe 1 im Multicolormodus
SPRITE0COLOR        = $d027         ;(39) Farbe von Sprite 0
SPRITE1COLOR        = $d028         ;(40) Farbe von Sprite 1
SPRITE2COLOR        = $d029         ;(41) Farbe von Sprite 2
SPRITE3COLOR        = $d02a         ;(42) Farbe von Sprite 3
SPRITE4COLOR        = $d02b         ;(43) Farbe von Sprite 4
SPRITE5COLOR        = $d02c         ;(44) Farbe von Sprite 5
SPRITE6COLOR        = $d02d         ;(45) Farbe von Sprite 6
SPRITE7COLOR        = $d02e         ;(46) Farbe von Sprite 7
 
;*******************************************************************************
;*** Die VIC II Register  -  ENDE                                            ***
;*******************************************************************************
 
SCREENRAM           = $0400             ;Beginn des Bildschirmspeichers
SPRITE0DATA         = SCREENRAM+$03f8   ;Sprite-Pointer für die
                                        ;Adresse der Sprite-0-Daten
SPRITE1DATA         = SCREENRAM+$03f9   ;wie eben, nur für Sprite-1
SPRITE2DATA         = SCREENRAM+$03fa 
SPRITE3DATA         = SCREENRAM+$03fb 
SPRITE4DATA         = SCREENRAM+$03fc 
SPRITE5DATA         = SCREENRAM+$03fd
SPRITE6DATA         = SCREENRAM+$03fe 
SPRITE7DATA         = SCREENRAM+$03ff  
 
;*** Variablen
SCREENRAM       = $0400         ;Start des Bildschirmspeichers
CHAR            = $41           ;Pik-Zeichen für die Ausgabe
COLORRAM        = $d800         ;Start des Farb-RAMs
COLORNO         = $00           ;Schwarz ($00) als Zeichenfarbe
SCREENZEROADR   = $fb           ;Zero-Page Adr. für BS-Speicher Adr.
COLORZEROADR    = $fd           ;Zero-Page Adr. für Farb-RAM Adresse
VAREINS         = $00
VARZWEI         = $00
VARDREI         = $00

 

*=$0801
!byte $0c,$08,$e2,$07,$9e,$20,$32,$30,$36,$32,$00,$00,$00



 
            lda #COLOR_LIGHTGREY
            sta $d020                       ; Farbe des Bildschirms auf 0 setzen
            sta $d021                       ; Hintergrundfarbe des Bildschirms auf 0 setzen
            lda #147                        ; Steuerzeichen für Bildschirm löschen
            jsr $ffd2                       ; Löschen durchführen

           ; ZEIL=0
           ; TEXTFARBE=149              ; Steuerzeichen für Textfarbe
            ;ZEILE=2                    ; Zeilenvariable
            ldx #0
           
            stx $02                         ; Speicherort für den Schleifenzähler
            lda #0
            sta $002a                       ; Speicherort für die Frage nach dem Farbwechsel des Spielfeldes 00 = weiss, 01 = grün
            lda #0
            sta $0052                       ; Speicherort für die Info über die aktuelle Textfarbe 
            lda #0
            sta $00fb                       ; Speicherort zum Abzählen von jeweils drei Reihen, um Farbe doppelt zu wechseln
             
            lda #18                         ; Steuerzeichen für Textinvertierung, zum Zeichnen der Spielfelder
            jsr $ffd2 
            
            lda #05                         ; Steuerzeichen für Textfarbe Weiß (Startfarbe)
            jsr $ffd2 
            
loop        ;ZEILE+1                         ; Zeile um 1 erhöhen
            ;ZEIL=+1
            inc $02                         ; Zeilenzähler erhöhen
            lda #0
            sta $002a                       ; 3er-Zähler für Farbwechsel pro Feld auf 0 zurücksetzen um Karomuster zu ermöglichen
            
            lda $00fb                       ; hier wird geprüft ob bereits 3 Zeilen seit der letzten doppelten Farbänderung vergangen sind
            cmp #3
            beq dreizeilen
            inc $00fb
            
            
            
            
            
spaghetti        
            ldx $02
            cpx #25
            beq fastende    
            ldy #0                          ; spaltenzähler setzen
loop2                                       ;Zeilenschleifea
            lda $002a
            cmp #3            
            beq togglecol    
            inc $002a   
            
postcolor                                   ;marke für die Rückkehr von der Farbänderung
                       
            ldx $02                         ; Zähler laden
            iny                             ;  y erhöhen um neue Spalte zu setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #32                        
            jsr $ffd2                       ; Zeichen setzen         
            
            cpy #24                         ; prüfen ob 24 Zeichen (eine Zeile des Schachbretts) ausgegeben wurden
            beq wursthaar                   ; springen zu einem Spaghettiloop der erneut die Zeichenfarbe wechselt
            jmp loop2
    
            
togglecol   
            lda #1
            sta $002a
            lda $0052
            cmp #0
            beq setgreen
            
            lda #05                         ; Steuerzeichen für Textfarbe Weiß
            jsr $ffd2 
            lda #0
            sta $0052
            jmp postcolor
           
setgreen
            lda #30                         ; Steuerzeichen für Textfarbe Grün
            jsr $ffd2 
            lda #1
            sta $0052
            jmp postcolor                   
            
fastende
            jmp ende            

            
dreizeilen                                  ; noch eine Spaghettiabzweigung um nach drei Zeilen die Textfarbe doppelt zu ändern für Schachbrettmuster        

            lda $0052
            cmp #0
            beq setgrun
            
            lda #05                         ; Steuerzeichen für Textfarbe Weiß
            jsr $ffd2 
            lda #0
            sta $0052
            lda #1
            sta $00fb
            jmp spaghetti
           
setgrun
            lda #30                         ; Steuerzeichen für Textfarbe Grün
            jsr $ffd2 
            lda #1
            sta $0052                   
            lda #1
            sta $00fb
            jmp spaghetti                   ; zurückspringen in unser Hauptprogramm
            
            
wursthaar

            lda $0052
            cmp #0
            beq setgruen
            
            lda #05                         ; Steuerzeichen für Textfarbe Weiß
            jsr $ffd2 
            lda #0
            sta $0052

            jmp loop                        ; nach Zeilenende zurück in den Loop um die nächste Zeile zu malen
           
setgruen
            lda #30                         ; Steuerzeichen für Textfarbe Grün
            jsr $ffd2 
            lda #1
            sta $0052                   

            jmp loop                   ;  nach Zeilenende zurück in den Loop um die nächste Zeile zu malen

ende                                        ; Feldmarkierungen am Spielfeldrand zeichnen
                                        
            ldx #0
            ldy #2                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #146                        ; Steuerzeichen für Ausschaltung der Textinvertierung
            jsr $ffd2 
            lda #65                         ; Petscii für das Zeichen A, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #0
            ldy #5                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #66                         ; Petscii für das Zeichen B, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #0
            ldy #8                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #67                        ; Petscii für das Zeichen C, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #0
            ldy #11                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #68                        ; Petscii für das Zeichen D, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #0
            ldy #14                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #69                        ; Petscii für das Zeichen E, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #0
            ldy #17                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #70                        ; Petscii für das Zeichen F, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #0
            ldy #20                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #71                        ; Petscii für das Zeichen G, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #0
            ldy #23                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #72                        ; Petscii für das Zeichen H, zum Testen
            jsr $ffd2                       ; Zeichen setzen

            ldx #2
            ldy #0                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #56                        ; Petscii für das Zeichen 8, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #5
            ldy #0                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #55                        ; Petscii für das Zeichen 7, zum Testen
            jsr $ffd2                       ; Zeichen setzen
        
            ldx #8
            ldy #0                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #54                        ; Petscii für das Zeichen 6, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #11
            ldy #0                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #53                        ; Petscii für das Zeichen 5, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #14
            ldy #0                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #52                        ; Petscii für das Zeichen 4, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #17
            ldy #0                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #51                        ; Petscii für das Zeichen 3, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #20
            ldy #0                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #50                        ; Petscii für das Zeichen 2, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #23
            ldy #0                          ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #49                        ; Petscii für das Zeichen 1, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            
            ldx #2
            ldy #26                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #75                        ; Petscii für das Zeichen K, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            
            ldx #2
            ldy #27                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #82                        ; Petscii für das Zeichen R, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #2
            ldy #28                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #65                        ; Petscii für das Zeichen A, zum Testen
            jsr $ffd2                       ; Zeichen setzen

            ldx #2
            ldy #29                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #85                        ; Petscii für das Zeichen U, zum Testen
            jsr $ffd2                       ; Zeichen setzen

            ldx #2
            ldy #30                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #84                        ; Petscii für das Zeichen T, zum Testen
            jsr $ffd2                       ; Zeichen setzen

            ldx #2
            ldy #31                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #67                        ; Petscii für das Zeichen C, zum Testen
            jsr $ffd2                       ; Zeichen setzen

            ldx #2
            ldy #32                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #72                        ; Petscii für das Zeichen H, zum Testen
            jsr $ffd2                       ; Zeichen setzen

            ldx #2
            ldy #33                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #69                        ; Petscii für das Zeichen E, zum Testen
            jsr $ffd2                       ; Zeichen setzen

            ldx #2
            ldy #34                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #83                        ; Petscii für das Zeichen S, zum Testen
            jsr $ffd2                       ; Zeichen setzen    
    
            ldx #2
            ldy #35                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #83                        ; Petscii für das Zeichen S, zum Testen
            jsr $ffd2                       ; Zeichen setzen         
            
            ldx #4
            ldy #27                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #86                        ; Petscii für das Zeichen V, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #4
            ldy #28                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #69                        ; Petscii für das Zeichen E, zum Testen
            jsr $ffd2                       ; Zeichen setzen
            
            ldx #4
            ldy #29                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #82                         ; Petscii für das Zeichen R, zum Testen
            jsr $ffd2                       ; Zeichen setzen

            ldx #4
            ldy #30                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #83                         ; Petscii für das Zeichen S, zum Testen
            jsr $ffd2                       ; Zeichen setzen

            ldx #4
            ldy #31                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #46                         ; Petscii für das Zeichen ., zum Testen
            jsr $ffd2                       ; Zeichen setzen

            ldx #4
            ldy #33                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #48                         ; Petscii für das Zeichen 0, zum Testen
            jsr $ffd2                       ; Zeichen setzen

            ldx #4
            ldy #34                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #46                         ; Petscii für das Zeichen ., zum Testen
            jsr $ffd2                       ; Zeichen setzen

            ldx #4
            ldy #35                         ; Spalte setzen
            clc                             ; Carry-Flag = 0 Cursorposition setzen, = 1 Cursorposition lesen
            jsr $fff0                       ; Cursor setzen
            lda #49                         ; Petscii für das Zeichen 1, zum Testen
            jsr $ffd2                       ; Zeichen setzen

   
      
       
                        
        cli
        jmp *
;----------------------------------------------------------
