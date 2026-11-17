// Box.asm - draws a black box while any key is pressed.
//
// K = 71:  the box starts at row 71, is 20 rows tall and
//          16 * ((71 mod 4) + 1) = 64 pixels (4 words) wide, from the left edge.
// Screen: one row = 32 words, so row r starts at SCREEN + 32*r.
//         Row 71 starts at 16384 + 32*71 = 18656.

(LOOP)
    // color = -1 (black) if a key is pressed, otherwise 0 (white)
    @color
    M=0
    @KBD
    D=M
    @DRAW
    D;JEQ
    @color
    M=-1

(DRAW)
    // addr = first word of row 71 = SCREEN + 32*71 = 18656
    @18656
    D=A
    @addr
    M=D
    // rows = 20
    @20
    D=A
    @rows
    M=D

(ROW)
    // cols = 4 words per row
    @4
    D=A
    @cols
    M=D

(COL)
    // RAM[addr] = color, then move to the next word
    @color
    D=M
    @addr
    A=M
    M=D
    @addr
    M=M+1
    // more words in this row?
    @cols
    MD=M-1
    @COL
    D;JGT

    // go to the start of the next row: skip the other 32 - 4 = 28 words
    @28
    D=A
    @addr
    M=D+M
    // more rows?
    @rows
    MD=M-1
    @ROW
    D;JGT

    @LOOP
    0;JMP