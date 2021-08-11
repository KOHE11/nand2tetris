// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

    @R2
    M=0     // RAM[2]=0
    @R3      
    M=0     // RAM[3]=0
(LOOP)
    @R1
    D=M     // D=RAM[1]
    @R3
    D=D-M   // D=D-RAM[3]
    @END
    D;JEQ   // if (D==0) goto END
    @R0
    D=M     // D=RAM[0]
    @R2
    M=D+M   // RAM[2]=D+RAM[2]
    @R3
    D=M     // D=RAM[3]
    @1
    D=D+A   // D=D+1
    @R3
    M=D     // RAM[3]=D
    @LOOP
    0;JMP   // goto LOOP
(END)
    @END
    0;JMP
