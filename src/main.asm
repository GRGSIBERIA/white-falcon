    .inesprg 1
    .ineschr 1
    .inesmir 0
    .inesmap 0

    .bank 1
    .org $FFFA

    .dw 0
    .dw MainLoop
    .dw 0

    .bank 0

    .org $8000

MainLoop:
    lda $2002   ; NEGでVBlank割り込み
    bpl MainLoop   ; NEGが立つまで待機

    ldx <$00
    dec
    bmi _Main    ; 1

    dec
    bmi _Game    ; 2

    dec
    bmi _GG      ; 3

    jmp MainLoop

_Start:
    .include "start.asm"
    jmp MainLoop
_Game:
    .include "game.asm"
    jmp MainLoop
_GG:
    .include "gg.asm"
    jmp MainLoop