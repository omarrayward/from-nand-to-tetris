// declare SimpleFunction.test with locals 2// label SimpleFunction.test
(SimpleFunction.test)
// push constant 0 
@0
D=A
@SP
M=M+1
A=M-1
M=D
// pop from stack to segment LCL 0 
@0
D=A
@LCL
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
// push constant 0 
@0
D=A
@SP
M=M+1
A=M-1
M=D
// pop from stack to segment LCL 1 
@1
D=A
@LCL
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

// push from segment LCL to stack 0 
@0
D=A
@LCL
A=M+D
D=M
@SP
M=M+1
A=M-1
M=D

// push from segment LCL to stack 1 
@1
D=A
@LCL
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

// not 
@SP
A=M-1
M=!M

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

// add 
@SP
AM=M-1
D=M
M=0
@SP
A=M-1
M=D+M

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

// sub 
@SP
AM=M-1
D=M
M=0
@SP
A=M-1
M=M-D

// return
@LCL
D=M
@R13
M=D
@5
D=D-A
@R14
M=D
@SP
AM=M-1
D=M
M=0
@ARG
A=M
M=D
D=A+1
@SP
M=D
@R13
A=M-1
D=M
@THAT
M=D
@2
D=A
@R13
D=M-D
A=D
D=M
@THIS
M=D
@3
D=A
@R13
D=M-D
A=D
D=M
@ARG
M=D
@4
D=A
@R13
D=M-D
A=D
D=M
@LCL
M=D
@R14
A=M
0;JMP

