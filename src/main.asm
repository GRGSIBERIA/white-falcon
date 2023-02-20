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

    ; スタート画面にセット
    lda #01
    sta <$00

MainLoop:
    lda $2002   ; NEGでVBlank割り込み
    bpl MainLoop   ; NEGが立つまで待機

    ldx <$00
    dex
    bne _Start    ; 1

    dex
    bne _Game    ; 2

    dex
    bne _GG      ; 3

    jmp MainLoop

_Start:
    .include "src\start.asm"
    jmp MainLoop
_Game:
    .include "src\game.asm"
    jmp MainLoop
_GG:
    .include "src\gg.asm"
    jmp MainLoop