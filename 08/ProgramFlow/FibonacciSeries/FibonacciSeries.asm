// push from segment ARG to stack 1 
@1
D=A
@ARG
A=M+D
D=M
@SP
M=M+1
A=M-1
M=D

// pop from stack to register 4
@SP
AM=M-1
D=M
M=0
@4
M=D
// push constant 0 
@0
D=A
@SP
M=M+1
A=M-1
M=D

// pop from stack to segment THAT 0 
@0
D=A
@THAT
D=D+M
@R13
M=D
@SP
AM=M-1
D=M
M=0
@R13
A=M
M=D

// push constant 1 
@1
D=A
@SP
M=M+1
A=M-1
M=D

// pop from stack to segment THAT 1 
@1
D=A
@THAT
D=D+M
@R13
M=D
@SP
AM=M-1
D=M
M=0
@R13
A=M
M=D

// push from segment ARG to stack 0 
@0
D=A
@ARG
A=M+D
D=M
@SP
M=M+1
A=M-1
M=D

// push constant 2 
@2
D=A
@SP
M=M+1
A=M-1
M=D

// sub 
@SP
AM=M-1
D=M
M=0
@SP
A=M-1
M=M-D

// pop from stack to segment ARG 0 
@0
D=A
@ARG
D=D+M
@R13
M=D
@SP
AM=M-1
D=M
M=0
@R13
A=M
M=D

// label MAIN_LOOP_START
(MAIN_LOOP_START)

// push from segment ARG to stack 0 
@0
D=A
@ARG
A=M+D
D=M
@SP
M=M+1
A=M-1
M=D

// goto handler COMPUTE_ELEMENT
@SP
AM=M-1
D=M
M=0
@COMPUTE_ELEMENT
D;JNE

// go handler END_PROGRAM
@END_PROGRAM
0;JMP

// label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)

// push from segment THAT to stack 0 
@0
D=A
@THAT
A=M+D
D=M
@SP
M=M+1
A=M-1
M=D

// push from segment THAT to stack 1 
@1
D=A
@THAT
A=M+D
D=M
@SP
M=M+1
A=M-1
M=D

// add 
@SP
AM=M-1
D=M
M=0
@SP
A=M-1
M=D+M

// pop from stack to segment THAT 2 
@2
D=A
@THAT
D=D+M
@R13
M=D
@SP
AM=M-1
D=M
M=0
@R13
A=M
M=D

@4
D=M
@SP
M=M+1
A=M-1
M=D

// push constant 1 
@1
D=A
@SP
M=M+1
A=M-1
M=D

// add 
@SP
AM=M-1
D=M
M=0
@SP
A=M-1
M=D+M

// pop from stack to register 4
@SP
AM=M-1
D=M
M=0
@4
M=D
// push from segment ARG to stack 0 
@0
D=A
@ARG
A=M+D
D=M
@SP
M=M+1
A=M-1
M=D

// push constant 1 
@1
D=A
@SP
M=M+1
A=M-1
M=D

// sub 
@SP
AM=M-1
D=M
M=0
@SP
A=M-1
M=M-D

// pop from stack to segment ARG 0 
@0
D=A
@ARG
D=D+M
@R13
M=D
@SP
AM=M-1
D=M
M=0
@R13
A=M
M=D

// go handler MAIN_LOOP_START
@MAIN_LOOP_START
0;JMP

// label END_PROGRAM
(END_PROGRAM)

