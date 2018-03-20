// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

    // Gets the first value
    @0
    D=A
    @result
    M=D
    @R2
    M=D // Sets the result to 0 before starts

    // Gets the second velue, which will be used as counter
    @R1
    D=M
    @n
    M=D

    // If multiply R0 0 times, go to end.
    @END
    D;JEQ

(LOOP)
    // Sum result with first value
    @R0
    D=M
    @result
    M=M+D

    // Decrements n and go back to loop
    @n
    M=M-1
    D=M
    @LOOP
    D;JGT

    // Sets the result to R2
    @result
    D=M
    @R2
    M=D

(END)
    @END
    0;JMP
