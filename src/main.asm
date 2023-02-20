    .inesprg 1
    .ineschr 1
    .inesmir 0
    .inesmap 0

    .bank 1
    .org $FFFA

    .dw 0
    .dw Start
    .dw 0

    .bank 0

    .org $8000

Start:
    lda $2002   ; NEGでVBlank割り込み
    bpl Start   ; NEGが立つまで待機

    ldx <$00
    dec
    bmi _Main    ; 1

    dec
    bmi _Game    ; 2

    dec
    bmi _GG      ; 3

_Main:
    jmp Main
_Game:
    jmp Game
_GG:
    jmp GG

    jmp Start