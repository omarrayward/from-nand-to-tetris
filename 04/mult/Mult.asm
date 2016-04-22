// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// Sum R1 with it self R2 times

// Initialize i to R1
@R1
D=M
@i
M=D

// Initialize result to 0
@R2
M=0

// The loop is going to decrease i by 1 and if its greater than 0 we
// sum R1 to the result if not we go to end
(LOOP)
// If i is 0 => End the program
@i
D=M
@END
D;JEQ

// Add R0 to result
@R0
D=M
@R2
M=D+M

// Decrease the value of i
@i
M=M-1

@LOOP
0; JMP


(END)
@END
0; JMP
