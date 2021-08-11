// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

    @8192   // 512 * 256 / 16
    D=A     // D=8192
    @words_of_pixel
    M=D     // words_of_pixel=D
(WHILE)
    @i
    M=0     // i=0
    @KBD
    D=M     // D=RAM[KBD]
    @ON
    D;JNE   // if (D!=0) goto ON
    @OFF
    0;JMP   // goto OFF
(ON)
    @i
    D=M     // D=i
    @SCREEN
    A=A+D   // A=A+D
    M=-1     // RAM[A+D]=(ALL 1)
    @words_of_pixel
    D=M     // D=words_of_pixel
    @i
    D=D-M   // D=D-i
    @WHILE
    D;JEQ   // if (D==0) goto WHILE
    @i
    M=M+1   // i=i+1
    @ON
    0;JMP   // goto ON
(OFF)
    @i
    D=M     // D=i
    @SCREEN
    A=A+D   // A=A+D
    M=0     // RAM[A+D]=0
    @words_of_pixel
    D=M     // D=words_of_pixel
    @i
    D=D-M   // D=D-i
    @WHILE    
    D;JEQ   // if (D==0) goto WHILE
    @i
    M=M+1   // i=i+1
    @OFF
    0;JMP   // goto OFF
