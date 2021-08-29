INCLUDE macros.inc
.MODEL HUGE
.STACK 128
.DATA 
;************DATA************
EXIT DB 0 

; date jucatori

INITIAL_P1_X DW 50
INITIAL_P1_Y DW 38
INITIAL_P2_X DW 250
INITIAL_P2_Y DW 38

PLAYER1x    DW ?
PLAYER1y    DW ?
PLAYER2X    DW ?
PLAYER2Y    DW ?

PLAYER_HEIGHT  DW 20 
PLAYER_WIDTH   DW 20

PLAYER1_STAND  DB ?
PLAYER2_STAND  DB ?

STEPLENGTH    DB 15

; date arme

ARROW1X DW 0d
ARROW1Y DW 0d

ARROW2X DW 300d
ARROW2Y DW 100d

ARROW1_STATUS DW 0D
ARROW2_STATUS DW 0D

CLEAN_ARROWX DW 0D
CLEAN_ARROWY DW 0D

; grafica deschidere si inchidere cu mesaje relevante

GAME_START_STR DB '  ',0ah,0dh
  db   '                                                                    ',0ah,0dh
  db   '                                                                    ',0ah,0dh
  db   '                                                                    ',0ah,0dh
  db   '                                                                    ',0ah,0dh
  db   '                                                                    ',0ah,0dh
  db   '                                                                    ',0ah,0dh
  db   '                                                                    ',0ah,0dh
  DB   '               # # # # # # # # # # # # # # # # # # # # # # # # # # #',0ah,0dh
  DB   '               #                                                   #',0ah,0dh                                        
  DB   '               #                    KILL OR DIE                    #',0ah,0dh
  DB   '               #                                                   #',0ah,0dh
  DB   '               # # # # # # # # # # # # # # # # # # # # # # # # # # #',0ah,0dh
  DB   '               #                                                   #',0ah,0dh
  DB   '               #   Please ENTER the name of the first player       #',0ah,0dh
  DB   '               #              then press Enter                     #',0ah,0dh   
  DB   '               #   Please ENTER the name of the second player      #',0ah,0dh
  DB   '               #              then press Enter to start play       #',0ah,0dh
  DB   '               #                                                   #',0ah,0dh
  DB   '               #                                                   #',0ah,0dh 
  DB   '               #                                                   #',0ah,0dh
  DB   '               #                                                   #',0ah,0dh
  DB   '               # # # # # # # # # # # # # # # # # # # # # # # # # # #',0ah,0dh
  DB   '$',0ah,0dh 
WINNER_NAME DB '       ', '$'
SCORE_WINNER DB ' '
SCORE_LOSER DB ' ' 
GAME_OVER_STR DB '  ', 0ah,0dh
  DB   '               # # # # # # # # # # # # # # # # # # # # # # # # # # #',0ah,0dh
  DB   '               #                                                   #',0ah,0dh                                        
  DB   '               #                   KILL OR DIE                     #',0ah,0dh
  DB   '               #                                                   #',0ah,0dh
  DB   '               # # # # # # # # # # # # # # # # # # # # # # # # # # #',0ah,0dh
  DB   '               #                                                   #',0ah,0dh
  DB   '               #                    GAME OVER                      #',0ah,0dh
  DB   '               # # # # # # # # # # # # # # # # # # # # # # # # # # #',0ah,0dh
  DB   '$',0ah,0dh

CONGRATULATIONS DB 'Congratulations ', '$'
SCOREIS DB 'The Score is ', '$'
ENDL DB 0ah, 0dh

; forma hartii implementate

;      1---------          2---------
;          3---------------------
;      4---------          5---------

; legaturi drumuri harta

STEP14_BEG_X  DW 40
STEP14_END_X  DW 140

STEP25_BEG_X  DW 180
STEP25_END_X  DW 280

STEP3_BEG_X  DW 190
STEP3_END_X  DW 230

STEP12_Y     DB 90
STEP3_Y      DB 130
STEP45_Y     DB 170

STEPBEGINY    DW 90D
STEPINTERVALY DW 40D    

; culori asociate cu biti pentru colorare harta, jucatori, obiecte

RED EQU 04h
WHITE EQU 0fh
BLACK EQU 00h
YELLOW EQU 0Eh
BLUE EQU 01h
Cyan EQU 03h
BROWN EQU 06h
GREEEN EQU 02H
LIGHT_RED EQU 0CH
light_green EQU 0ah
gray EQU 07h
Dark_Gray EQU 08h
LIGHT_cyan EQU 0bh
BGC EQU LIGHT_cyan

; constante numerice

TWENTY db 20
TWELVE db 12
EIGHT  db 8
SEVEN  db 7

; forma primul jucator 

player1shape DB   BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BLACK,Dark_Gray,gray,gray,gray,Dark_Gray,BLACK,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BLACK,Dark_Gray,gray,gray,gray,gray,Dark_Gray,BLACK,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BGC,BGC,BLACK,Dark_Gray,Dark_Gray,gray,gray,gray,gray,gray,Dark_Gray,BLACK,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BGC,BLACK,Dark_Gray,gray,gray,gray,gray,gray,gray,Dark_Gray,BLACK,BGC,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BGC,BLACK,Dark_Gray,gray,gray,gray,gray,gray,gray,gray,gray,gray,Dark_Gray,BLACK,BGC,BGC
             DB   BGC,BGC,BLACK,Dark_Gray,Dark_Gray,Dark_Gray,gray,gray,Dark_Gray,gray,gray,gray,gray,gray,Dark_Gray,BLACK,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BLACK,Dark_Gray,Dark_Gray,gray,gray,gray,gray,Dark_Gray,gray,gray,Dark_Gray,BLACK,BGC,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BLACK,Dark_Gray,Dark_Gray,gray,BROWN,BLACK,BROWN,BLACK,YELLOW,BLACK,Dark_Gray,gray,Dark_Gray,Dark_Gray,BLACK,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BLACK,BLACK,BROWN,BROWN,YELLOW,BLACK,BLACK,YELLOW,BROWN,BLACK,BLACK,BGC,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BLACK,BLACK,BLACK,BLACK,BROWN,BROWN,YELLOW,BLACK,YELLOW,YELLOW,BLACK,BLACK,BGC,BGC,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BGC,BLACK,Cyan,BLACK,YELLOW,YELLOW,YELLOW,BROWN,BLACK,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BLACK,YELLOW,BLACK,BROWN,BLACK,YELLOW,BROWN,BLACK,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BLACK,BROWN,YELLOW,BLACK,Cyan,BLACK,BLACK,Cyan,BLACK,BLACK,BGC,BGC,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BLACK,RED,RED,BLACK,Cyan,Cyan,Cyan,BLACK,RED,BLACK,BGC,BGC,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BGC,BLACK,BLACK,Cyan,Cyan,BLACK,BLACK,BLACK,BLACK,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BGC,BLACK,Cyan,Cyan,BLACK,Cyan,Cyan,BLACK,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BLACK,BLUE,BLUE,BLACK,BGC,BLACK,BLUE,BLUE,BLACK,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BLACK,BLACK,BLACK,BGC,BGC,BGC,BLACK,BLACK,BLACK,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             DB   BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC


; forma al doilea jucator

 player2shape DB BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BGC,BGC,Cyan,Cyan,BLUE,BLACK,BLACK,BLACK,BLACK,BGC,BGC,BGC,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BGC,BGC,BLUE,BLACK,Cyan,Cyan,Cyan,BLUE,BLACK,BLACK,BLACK,BGC,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BLACK,Cyan,Cyan,BLUE,BLUE,Cyan,Cyan,Cyan,Cyan,Cyan,BLACK,BLACK,BGC,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BLACK,Cyan,BLACK,BLUE,Cyan,Cyan,Cyan,BLUE,Cyan,BLUE,BLACK,BGC,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BLACK,BLUE,BLACK,BLUE,Cyan,BLACK,BLACK,BLACK,Cyan,Cyan,Cyan,BLUE,BLACK,BLACK,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BLACK,BLACK,Cyan,BLACK,BROWN,YELLOW,BLACK,BLACK,BLUE,BLACK,BLUE,BLACK,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BGC,BGC,BLACK,BROWN,YELLOW,BLACK,BLACK,YELLOW,BLACK,BROWN,BLACK,BGC,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BGC,BGC,BLACK,BLACK,YELLOW,YELLOW,BLACK,YELLOW,BROWN,BLACK,BGC,BGC,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BGC,BGC,BGC,BLACK,BROWN,YELLOW,YELLOW,YELLOW,BLACK,RED,BLACK,BGC,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BLACK,BROWN,YELLOW,BLACK,RED,BLACK,YELLOW,BLACK,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BGC,BGC,BLACK,BLACK,RED,BLACK,BLACK,RED,BLACK,YELLOW,YELLOW,BLACK,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BGC,BGC,BLACK,BROWN,BLACK,RED,RED,RED,BLACK,YELLOW,BROWN,BLACK,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BGC,BGC,BGC,BLACK,RED,RED,RED,RED,BLACK,BLACK,BGC,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BLACK,RED,RED,BLACK,BLACK,RED,RED,BLACK,BGC,BGC,BGC,BGC
              DB BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BLACK,BLACK,BLACK,BGC,BGC,BLACK,BLACK,BLACK,BGC,BGC,BGC,BGC,BGC,BGC        
              DB BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC    

; forma arme jucatori

ARROW1  db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
        db BGC,BGC,BGC,BGC,BLUE,BLUE,BLUE,BLUE,BGC,BGC,BGC,BGC
        db BGC,BGC,BGC,BLUE,Cyan,Cyan,Cyan,Cyan,BLUE,BGC,BGC,BGC
        db BGC,BGC,BLUE,Cyan,Cyan,Cyan,Cyan,Cyan,Cyan,BLUE,BGC,BGC
        db BGC,BLUE,Cyan,Cyan,Cyan,Cyan,Cyan,Cyan,Cyan,Cyan,BLUE,BGC
        db BGC,BLUE,Cyan,Cyan,Cyan,Cyan,Cyan,Cyan,Cyan,Cyan,BLUE,BGC
        db BGC,BLUE,Cyan,Cyan,Cyan,Cyan,Cyan,Cyan,Cyan,Cyan,BLUE,BGC
        db BGC,BLUE,Cyan,Cyan,Cyan,Cyan,Cyan,Cyan,Cyan,Cyan,BLUE,BGC
        db BGC,BGC,BLUE,Cyan,Cyan,Cyan,Cyan,Cyan,Cyan,BLUE,BGC,BGC
        db BGC,BGC,BGC,BLUE,Cyan,Cyan,Cyan,Cyan,BLUE,BGC,BGC,BGC
        db BGC,BGC,BGC,BGC,BLUE,BLUE,BLUE,BLUE,BGC,BGC,BGC,BGC
        db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC

ARROW2  db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
        db BGC,BGC,BGC,BGC,RED,RED,RED,RED,BGC,BGC,BGC,BGC
        db BGC,BGC,BGC,RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,RED,BGC,BGC,BGC
        db BGC,BGC,RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,RED,BGC,BGC
        db BGC,RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,RED,BGC
        db BGC,RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,RED,BGC
        db BGC,RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,RED,BGC
        db BGC,RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,RED,BGC
        db BGC,BGC,RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,RED,BGC,BGC
        db BGC,BGC,BGC,RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,LIGHT_RED,RED,BGC,BGC,BGC
        db BGC,BGC,BGC,BGC,RED,RED,RED,RED,BGC,BGC,BGC,BGC
        db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC

CLEARARROW  db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
            db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
            db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
            db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
            db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
            db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
            db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
            db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
            db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
            db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
            db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
            db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC

fireup db BGC ,RED ,BGC ,RED ,BGC ,BGC ,RED ,BGC
        db BGC ,BGC ,BGC ,RED ,RED ,BGC ,BGC ,BGC
        db BGC ,BGC ,RED ,RED ,RED ,BGC ,BGC ,BGC
        db BGC ,RED ,RED ,YELLOW ,RED ,RED ,BGC ,BGC
        db RED ,RED ,RED ,YELLOW ,RED ,RED ,BGC ,BGC
        db RED ,RED ,YELLOW ,YELLOW ,RED ,RED ,BGC ,BGC
        db RED ,YELLOW ,YELLOW ,RED ,RED ,BGC ,BGC ,BGC
        db BGC ,RED ,YELLOW ,RED ,BGC ,BGC ,BGC ,BGC

firedown    db BGC ,RED ,YELLOW ,RED ,BGC ,BGC ,BGC ,BGC
            db RED ,YELLOW ,YELLOW ,RED ,RED ,BGC ,BGC ,BGC
            db RED ,RED ,YELLOW ,YELLOW ,RED ,RED ,BGC ,BGC
            db RED ,RED ,RED ,YELLOW ,RED ,RED ,BGC ,BGC
            db BGC ,RED ,RED ,YELLOW ,RED ,RED ,BGC ,BGC
            db BGC ,BGC ,RED ,RED ,RED ,BGC ,BGC ,BGC
            db BGC ,BGC ,BGC ,RED ,RED ,BGC ,BGC ,BGC
            db BGC ,RED ,BGC ,RED ,BGC ,BGC ,RED ,BGC

fireright   db BGC ,BGC ,BGC ,BGC ,RED ,RED ,RED ,BGC 
            db RED ,BGC ,BGC ,RED ,RED ,RED ,YELLOW ,RED
            db BGC ,BGC ,RED ,RED ,RED ,YELLOW ,YELLOW ,YELLOW
            db RED ,RED ,RED ,YELLOW ,YELLOW ,YELLOW ,RED ,RED
            db BGC ,RED ,RED ,RED ,RED ,RED ,RED ,BGC
            db BGC ,BGC ,BGC ,RED ,RED ,RED ,BGC ,BGC
            db RED ,BGC ,BGC ,BGC ,BGC ,BGC ,BGC ,BGC
            db BGC ,BGC ,BGC ,BGC ,BGC ,BGC ,BGC ,BGC

fireleft    db BGC ,RED ,RED ,RED ,BGC ,BGC ,BGC ,BGC 
            db RED ,YELLOW ,RED ,RED ,RED ,BGC ,BGC ,RED
            db YELLOW ,YELLOW ,YELLOW ,RED ,RED ,RED ,BGC ,BGC
            db RED ,RED ,YELLOW ,YELLOW ,YELLOW ,RED ,RED ,RED
            db BGC ,RED ,RED ,RED ,RED ,RED ,RED ,BGC
            db BGC ,BGC ,RED ,RED ,RED ,BGC ,BGC ,BGC
            db BGC ,BGC ,BGC ,BGC ,BGC ,BGC ,BGC ,RED
            db BGC ,BGC ,BGC ,BGC ,BGC ,BGC ,BGC ,BGC

; date arme

fireupx dw ?
fireupy dw ?
fireDirection db ? 


; bara de viata si scor, nume jucatori

GameLevel db 1       

Health1 dw 5
Health2 dw 5
Health dw 0

Score1 db 0
Score2 db 0

PLAYER1 db 'A      Player 1 NAME:','$'
player2 db 'B      Player 2 NAME:','$'

PLAYER1_NAME DB 30,?,30 DUP('$') 
PLAYER2_NAME DB 30,?,30 DUP('$') 

Score db 'Score'
HealthString db 'Health'

; date miscare jucatori si obiecte 

tempW dw '$'
tempb db '$'

X1 DW '0'
X2 DW '0'
Y1 DW '0'
Y2 DW '0'

DX1 DW 0 
DY1 DW 0
DX2 DW 0
DY2 DW 0

; 3 puteri adaugate in joc prin obiecte 

; powerup1 = jucatorul primeste o viata in plus in runda respectiva  

powerup1 db BGC,BGC,BGC,BLACK,BLACK,BLACK,BGC,BLACK,BLACK,BLACK,BGC,BGC
         db BGC,BGC,BLACK,RED,RED,RED,BLACK,RED,RED,RED,BLACK,BGC
         db BGC,BLACK,RED,RED,RED,RED,RED,RED,white,RED,RED,BLACK
         db BGC,BLACK,RED,RED,RED,RED,RED,RED,RED,white,RED,BLACK
         db BGC,BLACK,RED,RED,RED,RED,RED,RED,RED,RED,RED,BLACK
         db BGC,BLACK,RED,RED,RED,RED,RED,RED,RED,RED,RED,BLACK
         db BGC,BGC,BLACK,RED,RED,RED,RED,RED,RED,RED,BLACK,BGC
         db BGC,BGC,BGC,BLACK,RED,RED,RED,RED,RED,BLACK,BGC,BGC
         db BGC,BGC,BGC,BGC,BLACK,RED,RED,RED,BLACK,BGC,BGC,BGC
         db BGC,BGC,BGC,BGC,BGC,BLACK,RED,BLACK,BGC,BGC,BGC,BGC
         db BGC,BGC,BGC,BGC,BGC,BGC,BLACK,BGC,BGC,BGC,BGC,BGC
         db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
         
; powerup2 = jucatorul care o detine isi dubleaza o data puterea de atac

powerup2 db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
         db BGC,BGC,BGC,BGC,BLACK,BLACK,BLACK,BLACK,BLACK,BGC,BGC,BGC
         db BGC,BGC,BGC,BLACK,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,BLACK,BGC,BGC
         db BGC,BGC,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,BLACK,BGC
         db BGC,BLACK,YELLOW,YELLOW,white,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,BLACK
         db BGC,BLACK,YELLOW,white,YELLOW,YELLOW,RED,YELLOW,YELLOW,YELLOW,YELLOW,BLACK
         db BGC,BLACK,YELLOW,white,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,BLACK
         db BGC,BLACK,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,RED,YELLOW,YELLOW,YELLOW,BLACK
         db BGC,BLACK,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,BLACK
         db BGC,BGC,BLACK,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,BLACK,BGC
         db BGC,BGC,BGC,BLACK,YELLOW,YELLOW,YELLOW,YELLOW,YELLOW,BLACK,BGC,BGC
         db BGC,BGC,BGC,BGC,BLACK,BLACK,BLACK,BLACK,BLACK,BGC,BGC,BGC

; powerup3 = jucatorul primeste avantajul de a nu primi o lovitura o singura data (imunitate o singura data)

powerup3 db BGC,BLACK,BLACK,BLACK,BLACK,BLACK,BLACK,BLACK,BLACK,BLACK,BLACK,BGC
         db BLACK,Gray,Gray,Gray,white,white,white,Gray,BLACK,Gray,Gray,BLACK
         db BLACK,Gray,Gray,Gray,white,white,white,Gray,BLACK,Gray,Gray,BLACK
         db BLACK,Gray,Gray,Gray,white,white,white,Gray,BLACK,Gray,Gray,BLACK
         db BLACK,Gray,Gray,Gray,white,white,white,Gray,BLACK,Gray,Gray,BLACK
         db BLACK,Gray,Gray,Gray,white,white,white,Gray,BLACK,Gray,Gray,BLACK
         db BLACK,Gray,Gray,Gray,white,white,white,Gray,BLACK,Gray,Gray,BLACK
         db BLACK,Gray,Gray,Gray,white,white,white,Gray,Gray,Gray,Gray,BLACK
         db BGC,BLACK,Gray,Gray,Gray,Gray,Gray,Gray,Gray,Gray,BLACK,BGC
         db BGC,BGC,BLACK,Gray,Gray,Gray,Gray,Gray,Gray,BLACK,BGC,BGC
         db BGC,BGC,BGC,BLACK,Gray,Gray,Gray,Gray,BLACK,BGC,BGC,BGC
         db BGC,BGC,BGC,BGC,BGC,BLACK,BLACK,BGC,BGC,BGC,BGC,BGC

; element folosit pt stergere putere dupa ce a fost absorbita

clearpowerup db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC           
             db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC           
             db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
             db BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC

; date pozitionare powerups si element stergere 

powerup1x dw ?
powerup1y dw ?
powerup2x dw ?
powerup2y dw ?
powerup3x dw ?
powerup3y dw ?

CLEARPOWERUPX dw ?
CLEARPOWERUPY dw ?

; starile in care se afla puterile (active, absorbite) 

POWERUP1STATUS db 1
POWERUP2STATUS db 1
POWERUP3STATUS db 1

; folosite pt dubla putere de atac, asociate celor 2 jucatori 

DOUBLE_POWER1  DB 0
DOUBLE_POWER2  DB 0

; folosite pentru scut, asociate celor 2 jucatori

SHIELD1        DB 0
SHIELD2        DB 0

; alte date folosite in implementare pt pozitionare si generare aleatoare a puterilor 

RAND_INDEX dw 0
RAND_NUMBER_DRAW Dw 0


Y_ARRAY_POWER_UP Dw 75,50,115,150,75,110,155, 135, 116
X_ARRAY_POWER_UP Dw 80,150,280,125,200,80,180, 95, 73

; codul principal - implementare elemente descrise anterior

.CODE
main proc far 

    mov ax,@DATA
    mov ds,ax

    ; mod grafic

    MOV AH, 0
    MOV AL, 13h
    INT 10h
        
    ; meniul ecranului de joc

    ; inceputul jocului 

    GAME_BEGIN:      
        
        ; mod grafic

        MOV AH, 0
        MOV AL, 13H
        INT 10H 

        ; bucla pentru desfasurarea jocului
      
        INFLOOP:

            MOV BL, STEPLENGTH  ; dimensiune pas de miscare 

            ; verifica daca exista un castigator

            CALL CHECK_HEALTH
            CMP SCORE1, 3
            JNE COMPARESCORE2
            JMP GAME_EXIT

            COMPARESCORE2:
            CMP SCORE2, 3
            JNE MOVINGLOOP
            JMP GAME_EXIT

            ; bucla pentru verificare miscare pe harta 

            MOVINGLOOP:
                PUSH BX
                PUSH CX
                
                ; pas de miscare arma

                MOV CX, 3
                MOV_ARROW_BY_3:
                    PUSH CX
                    PLAYER_HITTING
                    POP CX
                LOOP MOV_ARROW_BY_3

                POP CX
                POP BX

                ; verifica limitele de pozitionare ale obiectelor pe harta

                MOV tempW,1
                CALL Check_Positions_Boundaries
                
                MOV tempW,2
                CALL Check_Positions_Boundaries
                
                ; apeleaza directiva de desenare a barilor de viata 

                MOV tempb,1     
                CALL DRAW_SCORE_Health_Bar     
                MOV tempb,2         
                CALL DRAW_SCORE_Health_Bar 

                CMP BL, 0
                JNZ CONTINUE_MOVING
         
                ; pentru a minimiza saltul se trece in miscare

                SHORT_MOVINGLOOP_JMP:
                    JMP MOVINGLOOP

                ; jucatorii sunt desenati in miscare 

                CONTINUE_MOVING:
                    MOV TEMPB, 1
                    CALL DRAW_PLYAERS
                    MOV TEMPB, 2
                    CALL DRAW_PLYAERS

                ; micsoreaza saltul jucatorilor in miscare 

                DEC BL 


            JNZ SHORT_MOVINGLOOP_JMP 

            MOV DX1, 0
            MOV DY1, 2
            
            MOV DX2, 0
            MOV DY2, 2
        
        ; implementarea aparitiei aleatoare a puterilor pe harta 

            POP SI
            POP AX

            PUSH AX
            PUSH BX
            CALL KEY_PRESSED
            POP BX
            POP AX
            JMP INFLOOP

        ; sfarsit joc

        GAME_EXIT:
            CALL GAMEOVER_AND_EXIT

        mov ah,4ch
        int 21h 
        hlt
main ENDP 

; procedura verificare limite pozitii pe harta 

Check_Positions_Boundaries proc near

    ; verificare pozitie perspectiva jucator 1

        PUSH AX
        PUSH BX
        MOV AX,PLAYER1X
        MOV BX,PLAYER1Y
        CMP tempW,1
        JE PLA1
        MOV AX,PLAYER2X
        MOV BX,PLAYER2Y
      
        PLA1:
            cmp AX,1
            jne NOTLEFT1
            CMP tempW,1
            JE P1
            MOV PLAYER2X,2
            CMP GAMELEVEL,2
            JNE NOTLEFT1
            DEC Health2
            CALL DRAW_fire_frame
            JMP NOTLEFT1
        P1:
            MOV PLAYER1X,2
            CMP GAMELEVEL,2
            JNE NOTLEFT1
            DEC Health1
            CALL DRAW_fire_frame
        NOTLEFT1:

        cmp AX,299
        jne NOTRIGHT1
            CMP tempW,1
            JE P2
            MOV PLAYER2X,298
            CMP GAMELEVEL,2
            JNE NOTRIGHT1
            DEC Health2
            CALL DRAW_fire_frame
            JMP NOTRIGHT1
        P2:
            MOV PLAYER1X,298
            CMP GAMELEVEL,2
            JNE NOTRIGHT1
            DEC Health1
            CALL DRAW_fire_frame
        NOTRIGHT1:

        CMP BX,31
        JNE NOTUP1
        CMP tempW,1
        JE P3
            MOV PLAYER2Y,32
            CMP GAMELEVEL,2
            JNE NOTUP1
            DEC Health2
            CALL DRAW_fire_frame
            JMP NOTUP1
        P3:
            MOV PLAYER1Y,32
            CMP GAMELEVEL,2
            JNE NOTUP1
            DEC Health1
            CALL DRAW_fire_frame
        NOTUP1:

        CMP BX,179
        JNE NODOWN1
        CMP tempW,1
        JE P4
            MOV PLAYER2Y,178
            CMP GAMELEVEL,2
            JNE NODOWN1
            DEC Health2
            CALL DRAW_fire_frame
            JMP NODOWN1
        P4:
            MOV PLAYER1Y,178
            CMP GAMELEVEL,2
            JNE NODOWN1
            CALL DRAW_fire_frame
            DEC Health1
        NODOWN1:


        ; caz de ciocnire/situare la distante foarte mici intre jucatori 

        MOV AX, PLAYER1Y
        MOV BX, PLAYER2Y

        ; se verifica distanta dintre jucatori

        ; verificare pozitie pe axa OY

        CMP AX, BX
        JNG SUB_BA_Y
            SUB AX, BX
            JMP SUB_AB_Y
        SUB_BA_Y:
            XCHG AX, BX
            SUB AX, BX
        SUB_AB_Y:
            CMP AX, 18
        JG NO_PLAYERS_COLLAIONS 
            
        ; verificare pozitie pe axa OX

        MOV AX, PLAYER1X
        MOV BX, PLAYER2X
        
        CMP AX, BX
        JNG SUB_BA_X
        SUB AX, BX
        JMP SUB_AB_X
        SUB_BA_X:
            XCHG AX, BX
            SUB AX, BX
        SUB_AB_X:
            CMP AX, 18
            JG NO_PLAYERS_COLLAIONS

        ; verificare pozitii stanga-dreapta jucatori

        MOV AX, PLAYER1X
        MOV BX, PLAYER2X

        CMP AX, BX
        JL PLAYER1_LEFT
        JMP PLAYER1_RIGHT
                
        PLAYER1_LEFT:
        DEC PLAYER1X
        INC PLAYER2X
        JMP END_PLAYERS_COLLASIONS
                
        PLAYER1_RIGHT:
        INC PLAYER1X
        DEC PLAYER2X
        JMP END_PLAYERS_COLLASIONS


        NO_PLAYERS_COLLAIONS:
        END_PLAYERS_COLLASIONS:

    ENDPL1:
        POP BX
        POP AX
    RET
Check_Positions_Boundaries ENDP

; procedura verificare viata jucatori

CHECK_HEALTH PROC NEAR

    ; compara vietile ambilor jucatori

    CMP Health1,0
    JNLE NOTDIE1
    INC SCORE2
    MOV Health1,5
    MOV Health2,5
    JMP REFREASH_GAME
    
    NOTDIE1:
        CMP Health2,0
        JNLE ENDCHECK
        INC SCORE1
        MOV Health1,5
        MOV Health2,5
        JMP REFREASH_GAME
    ENDCHECK:
    RET
CHECK_HEALTH ENDP

; procedura verificare mod atac jucatori

CHECK_ARROWS PROC NEAR 

        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
      
        ; verifica daca arma celor 2 jucatori loveste peretele si o sterge in acest caz

        MOV AX,ARROW1X
        MOV BX,ARROW1Y
        CMP tempW,1
        JE ARR
        MOV AX,ARROW2X
        MOV BX,ARROW2Y

        ARR:
        CMP AX, 10
        JGE NOTLEFT

        ; verifica daca vreo arma a lovit peretele stang 

        CMP tempW, 1
        JE A1
            MOV ARROW2X, 11
            MOV ARROW2_STATUS, 0
            MOV CLEAN_ARROWX, 11
            MOV CLEAN_ARROWY, BX
            MOV TEMPB,3
            CALL DRAW_ARROWS
            JMP HIT_PLAYER_CHECK
        A1:
            MOV ARROW1X, 11
            MOV ARROW1_STATUS,0
            MOV CLEAN_ARROWX, 11
            MOV CLEAN_ARROWY,BX
            MOV TEMPB,3
            CALL DRAW_ARROWS
            JMP HIT_PLAYER_CHECK
        
        ; daca nu a fost lovit peretele stang 
        ; verifica daca vreo arma a lovit peretele drept

        NOTLEFT:

        CMP AX, 299
        JLE NOTRIGHT
        CMP tempW,1
        JE A2
            MOV ARROW2X, 299
            MOV ARROW2_STATUS, 0
            MOV CLEAN_ARROWX, 299
            MOV CLEAN_ARROWY, BX
            MOV TEMPB,3
            CALL DRAW_ARROWS
            JMP HIT_PLAYER_CHECK
        A2:
            MOV ARROW1X, 299
            MOV ARROW1_STATUS,0
            MOV CLEAN_ARROWX, 299
            MOV CLEAN_ARROWY,BX
            MOV TEMPB,3
            CALL DRAW_ARROWS
            JMP HIT_PLAYER_CHECK
        
        ; nu a fost lovit peretele drept

        NOTRIGHT:

        ; daca arma unui jucator loveste celalalt jucator atunci
        ; viata celuilalt jucator scade cu 1 
        ; iar scorul jucatorului care a lovit creste cu 1
        ; jucatorul lovit este proiectat cu 10 pixeli in spate si lovitura armei este eliminata

        HIT_PLAYER_CHECK:
            
            ; jucatorul 1 loveste jucatorul 2

                MOV AX, ARROW2X
                MOV BX, PLAYER1Y
                SUB AX, PLAYER1X
                ADD AX, 12

                CMP AX, 4
                JL HIT_PLAYER2
                CMP AX, 30
                JG HIT_PLAYER2
                
            ; jucatorul 2 loveste jucatorul 1

                MOV AX, BX
                SUB AX, 14   
                ADD BX, 18
                CMP BX,ARROW2Y
                JLE HIT_PLAYER2
                CMP AX,ARROW2Y
                JGE HIT_PLAYER2
            
            ; se verifica efectul scutului 1 daca exista 

                CMP SHIELD1, 1
                JE ACTIVATE_SHIELD1

            ; se verifica daca exista puterea dublata a loviturii 

                CMP DOUBLE_POWER2, 0
                JE NO_DOUBLING2
                DEC HEALTH1
                MOV DOUBLE_POWER2, 0
                NO_DOUBLING2:
                    DEC Health1

            ; activare scut 

                ACTIVATE_SHIELD1:
                    CMP SHIELD1, 1
                    JNE NO_DEACTIVATE_SHIELD1
                    MOV SHIELD1, 0        

            ; nu exista scut 

                NO_DEACTIVATE_SHIELD1:

            ; se verifica starea loviturii armelor 

                MOV ARROW2_STATUS,0
                MOV AX,ARROW2X
                MOV BX,ARROW2Y
                MOV CLEAN_ARROWX,AX
                MOV CLEAN_ARROWY,BX
                MOV TEMPB,3
                CALL DRAW_ARROWS
                MOV ARROW2X,0
                MOV ARROW2Y,0
                
                ; ciocnire

                MOV DX1,2 ; deplasare la dreapta

                MOV AX, PLAYER1X
                CMP AX, PLAYER2X
                JL GO_LEFT_NOT_RIGHT1
                    MOV DX1, 1
                GO_LEFT_NOT_RIGHT1:

            ; perspectiva de atac jucator 2 

            HIT_PLAYER2:
                MOV AX, ARROW1X
                MOV BX, PLAYER2Y
                SUB AX, PLAYER2X
                ADD AX, 12    

                ; ciocnire jucatori 

                CMP AX, 4
                JL HIT_EACH_OTHER_CHECK 
                CMP AX, 30
                JG HIT_EACH_OTHER_CHECK
                
                ; cionire lovitura arma pe axa OY 
    
                MOV AX, BX  
                SUB AX, 14 
                ADD BX, 18
                CMP BX,ARROW1Y
                JLE HIT_EACH_OTHER_CHECK
                CMP AX,ARROW1Y
                JGE HIT_EACH_OTHER_CHECK

                ; verifica efectul scutului daca exista 

                CMP SHIELD2, 1
                JE ACTIVATE_SHIELD2

                ; verifica daca exista puterea dublata a loviturii 

                CMP DOUBLE_POWER1, 0
                JE NO_DOUBLING1
                DEC HEALTH2
                MOV DOUBLE_POWER1, 0
                NO_DOUBLING1:
                DEC Health2
                ACTIVATE_SHIELD2:
                
                CMP SHIELD2, 1
                JNE NO_DEACTIVATE_SHIELD2
                MOV SHIELD2, 0                
                NO_DEACTIVATE_SHIELD2:

                ; verificare stare lovitura

                MOV ARROW1_STATUS,0
                MOV AX,ARROW1X
                MOV BX,ARROW1Y
                MOV CLEAN_ARROWX,AX
                MOV CLEAN_ARROWY,BX
                MOV TEMPB,3
                CALL DRAW_ARROWS
                MOV ARROW1X,0
                MOV ARROW1Y,0
                
                ; ciocnire

                MOV DX2, 2 ; deplasare la dreapta

                MOV AX, PLAYER2X
                CMP AX, PLAYER1X
                JL GO_LEFT_NOT_RIGHT2
                MOV DX2, 1
                GO_LEFT_NOT_RIGHT2:

        ; cand lovesc amandoi jucatorii in acelasi timp se anuleaza efectul
    
         HIT_EACH_OTHER_CHECK:

             MOV AX,ARROW1X
             MOV BX,ARROW2X
             MOV CX,ARROW1Y
             MOV DX,ARROW2Y
             ADD AX,12D
             CMP AX,BX
             JNE ENDARR
             CMP CX,DX
             JNE ENDARR

             ; sterge prima lovitura

             MOV AX,ARROW1X
             MOV ARROW1_STATUS,0
             MOV CLEAN_ARROWX,AX
             MOV CLEAN_ARROWY,CX
             MOV TEMPB,3
             CALL DRAW_ARROWS

             ; sterge a doua lovitura

             MOV ARROW2_STATUS,0
             MOV CLEAN_ARROWX,BX
             MOV CLEAN_ARROWY,DX
             MOV TEMPB,3
             CALL DRAW_ARROWS

        
    ENDARR:
        POP DX
        POP CX
        POP BX
        POP AX
        RET
CHECK_ARROWS ENDP

; procedura implementare jucatori

DRAW_PLYAERS proc near

        mov si, 0
        mov cx, PLAYER1x
        mov dx, PLAYER1y 

        CMP TEMPB, 1
        JE MOV_PLAYER1_XY
        MOV CX, PLAYER2X
        MOV DX, PLAYER2Y
        MOV_PLAYER1_XY:

    draw1:
        cmp si,0
        jz no 
        mov ax ,si 
        DIV TWENTY
        cmp ah, 0
        jnz no 

        mov cx ,PLAYER1x
        CMP TEMPB, 1
        JE MOV_PLAYER1_X
            MOV CX, PLAYER2X
        MOV_PLAYER1_X:
        
        inc dx 
    no:     
        CMP TEMPB, 2
        JE GET_P2_SHAPE
        MOV DI, PLAYER1X
        CMP DI, PLAYER2X
        JG REVERSE_P1
        mov al,PLAYER1shape[si]
        JMP NOT_REVERSE_P1

        REVERSE_P1:
            MOV AL, REVERSE_P1_SHAPE[SI]

        NOT_REVERSE_P1:
            JMP END_GETTING_SHAPE

        GET_P2_SHAPE:
            MOV DI, PLAYER2X
            CMP DI, PLAYER1X
            JL REVERSE_P2
            mov al,PLAYER2shape[si]
            JMP NOT_REVERSE_P2

            REVERSE_P2:
                MOV AL, REVERSE_P2_SHAPE[SI]

            NOT_REVERSE_P2:

        END_GETTING_SHAPE:

        mov ah ,0ch
        int 10h
        inc cx
        inc si
        cmp si ,400
        jnz draw1
    ret
DRAW_PLYAERS ENDP

; procedura implementare lovituri

DRAW_ARROWS proc near
    mov si ,0
    mov cx , ARROW1X
    mov dx , ARROW1Y 

    CMP TEMPB, 2
    JNE MOV_ARROW1_XY
    MOV CX, ARROW2X
    MOV DX, ARROW2Y
    JMP DRAW4
    MOV_ARROW1_XY:

    CMP TEMPB,3
    JNE DRAW_ARROW1
    MOV CX, CLEAN_ARROWX
    MOV DX, CLEAN_ARROWY
    DRAW_ARROW1:



    draw4:  cmp si,0
            jz no4
            mov ax ,si 
            DIV TWELVE     
            cmp ah, 0
            jnz no4 
            mov cx ,ARROW1X
            CMP TEMPB, 2
            JNE MOV_ARROW2_X
            MOV CX, ARROW2X
            JMP CONTINUE
            MOV_ARROW2_X:

            CMP TEMPB, 3
            JNE MOV_CLEAN_X
            MOV CX, CLEAN_ARROWX
            MOV_CLEAN_X:
            CONTINUE:
            inc dx 
    no4:    mov al, ARROW1[si]

            CMP TEMPB, 2
            JNE GET_ARROW1_SHAPE
            MOV AL, ARROW2[SI]
            JMP GET_CLEAN_SHAPE
            GET_ARROW1_SHAPE:

            CMP TEMPB, 3
            JNE GET_CLEAN_SHAPE
            MOV AL, CLEARARROW[SI]
            GET_CLEAN_SHAPE:
            mov ah ,0ch
            int 10h
            inc cx
            inc si
            cmp si,144
            jnz draw4
            ret
DRAW_ARROWS ENDP

; procedura implementare flacari nivelul 2 de joc

DRAW_fire_frame proc near
    cmp GameLevel,2
    JE LEVEL2_ALREADY
        RET
    LEVEL2_ALREADY:

    mov cx ,19
    mov fireupy,30
    

    drawone1: 
        push cx
        mov fireupx,1
        mov fireDirection, 0
        
        mov si ,0
        mov cx , fireupx
        mov dx , fireupy 

    DRAW_FIRERIGHT:
        cmp si,0
        jz DRAW_8_RIGHT
        mov ax ,si 
        DIV eight     
        cmp ah, 0
        jnz DRAW_8_RIGHT 
        mov cx ,fireupx
        inc dx 

    DRAW_8_RIGHT:   
        mov al, fireright[si]            
        mov ah ,0ch
        int 10h
        inc cx
        inc si
        cmp si ,64
        jnz DRAW_FIRERIGHT


        mov fireupx,312
        mov fireDirection, 1
        
        mov si ,0
        mov cx , fireupx
        mov dx , fireupy 

    DRAW_FIRELEFT:
        cmp si,0
        jz DRAW_8_LEFT
        mov ax ,si 
        DIV eight     
        cmp ah, 0
        jnz DRAW_8_LEFT
        mov cx ,fireupx
        inc dx 
    
    DRAW_8_LEFT:   
        mov al, fireleft[si]                
        mov ah ,0ch
        int 10h
        inc cx
        inc si
        cmp si ,64
        jnz DRAW_FIRELEFT

        add fireupy,9
        pop cx
    loop drawone1

    mov cx ,35
    mov fireupx,1

    DRAWONE2: 
        push cx
        mov fireupy,30
        mov fireDirection, 2
        
        mov si ,0
        mov cx , fireupx
        mov dx , fireupy 

    DRAW_FIREUP:
        cmp si,0
        jz DRAW_8_UP
        mov ax ,si 
        DIV eight     
        cmp ah, 0
        jnz DRAW_8_UP 
        mov cx ,fireupx
        inc dx 

    DRAW_8_UP:   
        mov al, fireup[si]
        mov ah ,0ch
        int 10h
        inc cx
        inc si
        cmp si ,64
        jnz DRAW_FIREUP

        mov fireupy,192
        mov fireDirection, 3
        
        mov si ,0
        mov cx , fireupx
        mov dx , fireupy 

    DRAW_FIREDOWN: cmp si,0
        jz DRAW_8_DOWN
        mov ax ,si 
        DIV eight     
        cmp ah, 0
        jnz DRAW_8_DOWN 
        mov cx ,fireupx
        inc dx 
    DRAW_8_DOWN:   
        mov al, firedown[si]   
        mov ah ,0ch
        int 10h
        inc cx
        inc si
        cmp si ,64
        jnz DRAW_FIREDOWN

        add fireupx,9
        pop cx
    loop drawone2
    
    ret
DRAW_fire_frame endp

; procedura implementare bara de viata si scor

DRAW_SCORE_Health_Bar proc near

    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    ; miscare cursor

        mov dl,0ah ; pe coloana
        mov dh,1h ; pe linie
        mov bh,0 
        mov ah,02h
        int 10h

    ; implementare scor jucatori

        ; scorul jucatorului 1

            mov bl,4 ; culoare
            mov al,Score1
            add al,'0'
            mov ah,0eh
            int 10h

        ; scorul jucatorului 2

            ; cursorul de misca la dreapta
                mov dl,1dh
                mov ah,02h
                int 10h

                mov al,Score2
                add al,'0'
                mov ah,0eh
                int 10h

    ; implementare bara de viata jucatori

        mov al,02h
        mov ah,0ch
        mov cx,17h
        mov dx,Health1
        cmp tempb,1
        je PL1
        mov cx,010fh
        mov dx,Health2
        PL1:
        
        mov tempw,cx
        mov HEALTH,dx
        mov cx,5
        DrawHealth:
            mov si,6h
            xchg cx,tempw
            Wid:
                mov di,6h
                mov dx,14h       
                Hieg:
                    
                    xchg cx,tempw
                    cmp cx,HEALTH
                    jg EmptyBar
                    mov al,02h
                    jmp a
                    EmptyBar:
                    mov al,04h
                
                    a:xchg tempw,cx
                    cmp di,6h
                    jne g1
                    mov al,0fh
                    g1:cmp di,1h
                    jne g2
                    mov al,0fh
                    g2:cmp si,6h
                    jne g3
                    mov al,0fh
                    g3:cmp si,1h
                    jne green
                    mov al,0fh
                    green:
                     
                    int 10h
                    inc dx
                    dec di
                jnz Hieg
                inc cx
                dec si
            jnz Wid
            xchg cx,tempw
        loop DrawHealth 
        POP DX
        POP CX
        POP BX
        POP AX
        RET
DRAW_SCORE_Health_Bar ENDP

; procedura implementare conducere catre actiuni prin apasare pe taste

KEY_PRESSED proc near
    
    CALL STANDING_CHECK
                    
    MOV DI, 4
    LAST_4_PRESSED:

        MOV AH,1
        INT 16h
        JZ END_KEY_PRESSED1
        MOV AH, 0
        INT 16H
        CALL KEY_ACTIONS

    DEC DI
    CMP DI, 0
    JNZ LAST_4_PRESSED

    END_KEY_PRESSED1:
    RET 
KEY_PRESSED ENDP

; procedura implementare actiuni / alegere taste

KEY_ACTIONS PROC NEAR

    ; taste jucatorul 2

        CMP AH, 72            ; upkey pt salt
        JE PLAYER2_UPKEY

        CMP AH, 75            ; leftkey pt mers la stanga
        JE PLAYER2_LEFTKEY  

        CMP AH, 77            ; rightkey pt mers la dreapta
        JE PLAYER2_RIGHTKEY 

        CMP AL, 6BH            ; lovitura prin apasarea tastei k
        JE PLAYER2_HIT
        CMP AL, 4BH            ; lovitura prin apasarea tastei K
        JE PLAYER2_HIT


    ; taste jucatorul 1

        CMP AL, 77H
        JE PLAYER1_UPKEY     ; salt prin w   
        CMP AL, 57H
        JE PLAYER1_UPKEY     ; salt prin W

        CMP AL, 61H
        JE PLAYER1_LEFTKEY   ; mers stanga prin a     
        CMP AL, 41H
        JE PLAYER1_LEFTKEY   ; mers dreapta prin A

        CMP AL, 64H
        JE PLAYER1_RIGHTKEY  ; mers dreapta prin d
        CMP AL, 44H
        JE PLAYER1_RIGHTKEY  ; mers dreapta prin D

        CMP AL, 67H         ; lovitura prin apasarea tastei g
        JE PLAYER1_HIT
        CMP AL, 47H         ; lovitura prin apasarea tastei G
        JE PLAYER1_HIT
    RET


    ; actiuni jucator 2
        PLAYER2_UPKEY:
            CMP PLAYER2_STAND, 1
            JNE END_KEY_ACTIONS_SHORT

            MOV DY2, 1
            RET

        PLAYER2_RIGHTKEY:                                 
            MOV DX2, 1  
            RET        
        
        PLAYER2_LEFTKEY: 
            MOV DX2, 2 
            RET

        PLAYER2_HIT:  

            ; verifica daca exista deja o lovitura transmisa prin status

            CMP ARROW2_STATUS, 1
            JE END_KEY_ACTIONS_SHORT
            
            CALL DETERMINE_ARROW_DIR1
            
        END_KEY_ACTIONS_SHORT:
        JMP END_KEY_ACTIONS

    ; actiuni jucatorul 1

        PLAYER1_UPKEY:
            CMP PLAYER1_STAND, 1
            JNE END_KEY_ACTIONS

            MOV DY1, 1
            RET
        
        PLAYER1_LEFTKEY:
            MOV DX1, 2
            RET

        PLAYER1_RIGHTKEY:
            MOV DX1, 1
            RET
            
        PLAYER1_HIT:    
            
            ; verifica daca exista deja o lovitura transmisa prin status

            CMP ARROW1_STATUS,1
            JE END_KEY_ACTIONS
            
            CALL DETERMINE_ARROW_DIR2
    END_KEY_ACTIONS:

    RET
KEY_ACTIONS ENDP

; procedura determinare directie lovitura jucator 2

DETERMINE_ARROW_DIR1 PROC NEAR

    ; verificare ciocnire jucatori pe axa OY

    MOV AX, PLAYER1Y
    SUB AX, PLAYER2Y
    ADD AX, 20
    CMP AX, 0
    JL DRAW_ARROW1_LABEL
    CMP AX, 40
    JG DRAW_ARROW1_LABEL
    
    MOV AX, PLAYER1X
    MOV BX, PLAYER2X
    
    CMP AX, BX
    JNG SUB_BA_X_KEY3
    SUB AX, BX
    JMP SUB_AB_X_KEY4
    SUB_BA_X_KEY3:
    XCHG AX, BX
    SUB AX, BX
    SUB_AB_X_KEY4:
    
    ; verificare daca jucatorii sunt prea apropiati
    ; in acest caz loviturile nu vor avea efect

    CMP AX , 40
    JL END_ARROW_DIR1

    DRAW_ARROW1_LABEL:
        
        ; verificare lovitura jucator 2

        MOV ARROW2_STATUS,1
        MOV AX,PLAYER2X
        MOV BX,PLAYER2Y
        MOV ARROW2X,AX
        SUB ARROW2X,12
        
        ; corectare directie lovitura in functie de distanta fata de jucatorul 1 pe OX

        CMP AX, PLAYER1X
        JG RIGHT_ARROW_DIR
            ADD ARROW2X, 24
        RIGHT_ARROW_DIR:

        MOV ARROW2Y,BX
        ADD ARROW2Y,8
    
    END_ARROW_DIR1:
    RET
DETERMINE_ARROW_DIR1 ENDP

; procedura determinare directie lovitura jucator 1

DETERMINE_ARROW_DIR2 PROC NEAR
    MOV AX, PLAYER1Y
    SUB AX, PLAYER2Y
    ADD AX, 20
    CMP AX, 0
    JL DRAW_ARROW1_LABEL2
    CMP AX, 40
    JG DRAW_ARROW1_LABEL2
    
    MOV AX, PLAYER1X
    MOV BX, PLAYER2X
    
    CMP AX, BX
    JNG SUB_BA_X_KEY1
    SUB AX, BX
    JMP SUB_AB_X_KEY2
    SUB_BA_X_KEY1:
    XCHG AX, BX
    SUB AX, BX
    SUB_AB_X_KEY2:
  
    ; verificare daca jucatorii sunt prea apropiati
    ; in acest caz loviturile nu vor avea efect
    
    CMP AX , 40
    JL END_ARROW_DIR2
    
    ; verificare lovitura jucator 1
    DRAW_ARROW1_LABEL2:
        MOV ARROW1_STATUS,1
        MOV AX,PLAYER1X
        MOV BX,PLAYER1Y
        MOV ARROW1X,AX
        ADD ARROW1X,20

    ; corectare directie lovitura in functie de distanta fata de jucatorul 2 pe OX
        CMP AX, PLAYER2X
        JL RIGHT_ARROW_DIR_1
        SUB ARROW1X, 40
        RIGHT_ARROW_DIR_1:

        MOV ARROW1Y,BX
        ADD ARROW1Y,8

    END_ARROW_DIR2:
    RET 
DETERMINE_ARROW_DIR2 ENDP

; procedura verificare stare de repaus jucatori

STANDING_CHECK PROC NEAR 

    ; jucatorul 1 sta pe loc

    MOV CX, PLAYER1X

    CMP CX, PLAYER1X
    JE NO_MODIFICATION
    MOV CH, 0
    NO_MODIFICATION:
    MOV DX, PLAYER1Y
    ADD DX, PLAYER_HEIGHT
    MOV DH, 0
    DEC DX 

    ; se verifica distantele de pe harta pt localizarea jucatorului 1 in repaus

    CMP CX, 40 - 15
    JL NOT_1_OR_4
    CMP CX, 140 - 5
    JG NOT_1_OR_4
    JMP CHECK_Y_1245 

    NOT_1_OR_4:
    CMP CX, 180 - 15
    JL NOT_2_OR_5
    CMP CX, 280 - 5
    JG NOT_2_OR_5
    JMP CHECK_Y_1245 
 
    CHECK_Y_1245:    
    CMP DX, 90 - 1      
    JNZ NOT_STEP12
    MOV PLAYER1_STAND, 1
    JMP END_PLAYER1_STANDING
    NOT_STEP12:
    
    CMP DX, 170 - 1     
    JNZ NOT_STEP45
    MOV PLAYER1_STAND, 1
    JMP END_PLAYER1_STANDING
    NOT_STEP45:

    NOT_2_OR_5:
    CMP CX, 90 - 15
    JL NOT_STEP3
    CMP CX, 230 - 5
    JG NOT_STEP3
    
    CMP DX, 130 - 1     
    JNZ NOT_STEP3
    MOV PLAYER1_STAND, 1
    JMP END_PLAYER1_STANDING
    NOT_STEP3:

    CMP GAMELEVEL, 1
    JNE NOT_BASE_STANDING1

    CMP PLAYER1Y, 177
    JL NOT_BASE_STANDING1
    
    MOV PLAYER1_STAND, 1
    JMP END_PLAYER1_STANDING

    NOT_BASE_STANDING1:

    MOV PLAYER1_STAND, 0
    END_PLAYER1_STANDING:


    ; jucatorul 2 sta pe loc 

    MOV CX, PLAYER2X
    CMP CX, PLAYER2X
    JE NO_MODIFICATION_2
    MOV CH, 0
    NO_MODIFICATION_2:
    MOV DX, PLAYER2Y
    ADD DX, PLAYER_HEIGHT
    MOV DH, 0
    DEC DX 

    ; se verifica distantele de pe harta pt localizarea jucatorului 2 in repaus

    CMP CX, 40 - 15
    JL NOT_1_OR_4_2
    CMP CX, 140 - 5
    JG NOT_1_OR_4_2
    JMP CHECK_Y_1245_2 

    NOT_1_OR_4_2:
    CMP CX, 180 - 15
    JL NOT_2_OR_5_2
    CMP CX, 280 - 5
    JG NOT_2_OR_5_2
    JMP CHECK_Y_1245_2 
 
    CHECK_Y_1245_2:   
    CMP DX, 90 - 1     
    JNZ NOT_STEP12_2
    MOV PLAYER2_STAND, 1
    JMP END_PLAYER2_STANDING
    NOT_STEP12_2:
    
    CMP DX, 170 - 1      
    JNZ NOT_STEP45_2
    MOV PLAYER2_STAND, 1
    JMP END_PLAYER2_STANDING
    NOT_STEP45_2:

    NOT_2_OR_5_2:
    CMP CX, 90 - 15
    JL NOT_STEP3_2
    CMP CX, 230 - 5
    JG NOT_STEP3_2
    
    CMP DX, 130 - 1      
    JNZ NOT_STEP3_2
    MOV PLAYER2_STAND, 1
    JMP END_PLAYER2_STANDING
    NOT_STEP3_2:

    CMP GAMELEVEL, 1
    JNE NOT_BASE_STANDING2

    CMP PLAYER2Y, 177
    JL NOT_BASE_STANDING2
    
    MOV PLAYER2_STAND, 1
    JMP END_PLAYER2_STANDING

    NOT_BASE_STANDING2:

    MOV PLAYER2_STAND, 0
    END_PLAYER2_STANDING:

    RET
STANDING_CHECK ENDP

; implementare puteri !!!!!!!!!!!

DRAW_POWERUPS PROC near

    MOV SI,0
    MOV CX,powerup1x
    MOV DX,powerup1y
    CMP TEMPB,2
    JNE DRAW_powerup3
    MOV CX,POWERUP2X
    MOV DX,POWERUP2Y
    JMP draw_POWER_UP

    ; putere 3

    DRAW_powerup3:
    CMP TEMPB,3
    JNE DRAW_CLEAR_POWER_UP
    MOV CX,POWERUP3X
    MOV DX,POWERUP3Y
    JMP DRAW_POWER_UP

    DRAW_CLEAR_POWER_UP:
    CMP TEMPB,4
    JNE DRAW_POWER_UP1
    MOV CX,CLEARPOWERUPX
    MOV DX,CLEARPOWERUPY

    ; putere 1

    DRAW_POWER_UP1:
    draw_POWER_UP:  
    CMP si,0
    JZ DONT_DRAW
    MOV ax ,si 
    DIV TWELVE     
    CMP ah, 0
    JNZ DONT_DRAW 
    MOV CX,POWERUP1X

    CMP TEMPB,2
    JNE POWER_UP3
    MOV CX,POWERUP2X
    JMP CONTINUE_LOOP

    ; putere 2

    POWER_UP3:
    CMP TEMPB,3
    JNE CLEAR_POWER_UP
    MOV CX,POWERUP3X
    JMP CONTINUE_LOOP
    CLEAR_POWER_UP:
    CMP TEMPB,4
    JNE POWER_UP1
    MOV CX,CLEARPOWERUPX

    ; putere 1

    POWER_UP1:
    CONTINUE_LOOP:
    inc dx 
    DONT_DRAW:  
    MOV AL,POWERUP1[SI]

    CMP TEMPB,2
    JNE POWER_UP3_2
    MOV AL,POWERUP2[SI]
    JMP CONTINUE_DRAWING
    POWER_UP3_2:

    CMP TEMPB,3
    JNE POWER_UP1_2
    MOV AL,POWERUP3[SI]
    JMP CONTINUE_DRAWING
    POWER_UP1_2:
    CMP TEMPB,4
    JNE CLEAR_POWER_UP_1
    MOV AL,CLEARPOWERUP[SI]
    CLEAR_POWER_UP_1:
    CONTINUE_DRAWING:
    mov ah ,0ch
    int 10h
    inc cx
    inc si
    cmp si ,144
    jnz draw_POWER_UP
    ret
DRAW_POWERUPS endp

; procedura verificare ciocnire puteri 

CHECK_POWERUP_COLLISION proc near

    ; verificare ciocnire putere 1 

    CMP POWERUP1STATUS, 1
    JNE CHECK_POWER2_STATE
    CMP TEMPW, 1
    JE BEGIN_POWERUP_COLLISION

    ; verificare ciocnire putere 2

    CHECK_POWER2_STATE:
    CMP POWERUP2STATUS, 1
    JNE CHECK_POWER2_STATE2
    CMP TEMPW, 2
    JE BEGIN_POWERUP_COLLISION


    ; verificare ciocnire putere 3

    CHECK_POWER2_STATE2:
    CMP POWERUP3STATUS, 1
    JNE CHECK_POWER2_STATE3
    CMP TEMPW, 3
    JE BEGIN_POWERUP_COLLISION

    CHECK_POWER2_STATE3:

    RET

    BEGIN_POWERUP_COLLISION:

    PUSH AX
    PUSH BX

    MOV AX, PLAYER1X
    MOV BX, PLAYER1Y

    ; verificare putere pe axa OX

    CMP tempb, 1 
    JNE PLAYER2_POWERUP_CHECK
    MOV AX, PLAYER2X
    MOV BX, PLAYER2Y
    PLAYER2_POWERUP_CHECK:
    
    CMP TEMPW, 1
    JNE NOT_POWERUP1
    SUB AX, powerup1x
    SUB BX, powerup1Y
    JMP END_POWER_CHECK
    NOT_POWERUP1:
    
    CMP TEMPW, 2
    JNE NOT_POWERUP2
    SUB AX, powerup2x
    SUB BX, powerup2Y
    JMP END_POWER_CHECK
    NOT_POWERUP2:
    
    CMP TEMPW, 3
    JNE NOT_POWERUP3
    SUB AX, powerup3x
    SUB BX, powerup3Y
    JMP END_POWER_CHECK
    NOT_POWERUP3:

    END_POWER_CHECK:
    ADD AX, 20

    ; coordonata pe axa OX verificata

    CMP AX, 0
    JGE CHECK_POWERUP_ENDX
    POP BX
    POP AX
    RET

    CHECK_POWERUP_ENDX:
    CMP AX,32
    JLE CHECK_POWERUP_BEGY
    POP BX
    POP AX
    RET

    CHECK_POWERUP_BEGY:
   
    ; coordonata pe axa OY verificata

    ADD BX, 12
    CMP BX, 0
    JGE CHECK_POWERUP_ENDY
    POP BX
    POP AX
    RET

    ; verificare disparitie putere

    CHECK_POWERUP_ENDY:
    CMP BX,32
    JLE CHECK_POWERUP_BEG_
    POP BX
    POP AX
    RET

    ; verificare aparitie putere

    CHECK_POWERUP_BEG_:

        ; pt eliminare putere

        CMP TEMPW, 1
        JNE NOT_POWERUP1_1
        MOV AX,powerup1x
        MOV BX,powerup1y
        JMP CHOOSE_POWERUP_CLEAN
        NOT_POWERUP1_1:
        
        CMP TEMPW, 2
        JNE NOT_POWERUP2_1
        MOV AX,powerup2x
        MOV BX,powerup2y
        JMP CHOOSE_POWERUP_CLEAN
        NOT_POWERUP2_1:
        
        CMP TEMPW, 3
        JNE NOT_POWERUP3_1
        MOV AX,powerup3x
        MOV BX,powerup3y
        JMP CHOOSE_POWERUP_CLEAN
        NOT_POWERUP3_1:

        CHOOSE_POWERUP_CLEAN:
            
        MOV CLEARPOWERUPX, AX
        MOV CLEARPOWERUPY, BX

        ; implementare functionalitati puteri 

        ; puterea 1 = adauga 1 viata in plus jucatorului in runda

        CMP TEMPW, 1
        JNE CHECK_DOUBLE_POWER
        CMP tempb, 2
        JE INCREASE_PLAYER2_HEALTH
        CMP HEALTH2, 5
        JE DONOT_INC_HEALTH2
        INC Health2
        DONOT_INC_HEALTH2:

        MOV POWERUP1STATUS, 0
        MOV TEMPB,4
        CALL DRAW_POWERUPS
        JMP END_CHECK_POWERUP_COLLISION
        INCREASE_PLAYER2_HEALTH:
        CMP HEALTH1, 5
        JE DONOT_INC_HEALTH1
        INC Health1
        DONOT_INC_HEALTH1:
        
        MOV POWERUP1STATUS, 0
        MOV TEMPB,4
        CALL DRAW_POWERUPS
        JMP END_CHECK_POWERUP_COLLISION
        CHECK_DOUBLE_POWER:
        ;END OF HEALTH INCREASING

        ; puterea 2 = ofera dubla lovitura jucatorului 
        CMP TEMPW, 2
        JNE CHECK_SHIELD
        CMP tempb, 2
        JE DOUBLE_PLAYER2_POWER
        MOV POWERUP2STATUS, 0
        MOV DOUBLE_POWER2, 1
        MOV TEMPB,4
        CALL DRAW_POWERUPS
        JMP END_CHECK_POWERUP_COLLISION

        DOUBLE_PLAYER2_POWER:
        MOV POWERUP2STATUS, 0
        MOV DOUBLE_POWER1, 1
        MOV TEMPB,4
        CALL DRAW_POWERUPS
        JMP END_CHECK_POWERUP_COLLISION
        CHECK_SHIELD:
       

        ; puterea 3 = ofera imunitate o singura data unui jucator

        CMP TEMPW, 3
        JNE END_CHECK_POWERUP_COLLISION
        CMP tempb, 2
        JNE CHECK_SHIELD2
        MOV POWERUP3STATUS, 0
        MOV SHIELD1, 1
        MOV TEMPB,4
        CALL DRAW_POWERUPS
        JMP END_CHECK_POWERUP_COLLISION
        CHECK_SHIELD2:
        MOV POWERUP3STATUS, 0
        MOV SHIELD2, 1
        MOV TEMPB,4
        CALL DRAW_POWERUPS
        JMP END_CHECK_POWERUP_COLLISION
    
    END_CHECK_POWERUP_COLLISION:
    POP BX
    POP AX
    RET
CHECK_POWERUP_COLLISION endp
END main
