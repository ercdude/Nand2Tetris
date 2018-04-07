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

(LOOP)
    // save the last screen addr pointer
    @8191
    D = A
    @SCREEN
    D = D + A
    @addr
    M = D

    // Set default pix value as filled (1111111111111111), the same as if any key is pressed
    @pixvalue
    M = -1

    // save keyboard input pressed.
    @KBD
    D = M
    @pressed
    M = D

    @FILLSCREEN // If any key pressed, go to fillscreen
    D;JGT

    // If no key pressed, set pix group value to 0
    @pixvalue
    M = 0

(FILLSCREEN)
    // Check if the key pressed changed.
    @KBD
    D = M
    @pressed
    D = D - M
    @LOOP
    D;JNE

    // Check if i - [screen addr] equals to 0. If so, all pixels are filled.
    @addr
    D = M
    @SCREEN
    D = D - A
    @END
    D;JLT

    // Fill/clear pixel group
    @pixvalue
    D = M
    @addr
    A = M
    M = D

    @addr
    M = M - 1 // Subctract 1 because we started at the last group of pixels.

    @FILLSCREEN
    0;JMP

(END)
    @LOOP
    0;JMP
