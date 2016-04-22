// push constant 0 
@0
D=A
@SP
M=M+1
A=M-1
M=D

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

@LOOP_START

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

@SP
AM=M-1
D=M
M=0
@SP
A=M-1
M=D+M

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

@SP
AM=M-1
D=M
M=0
@SP
A=M-1
M=M-D

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

@SP
AM=M-1
D=M
M=0
@LOOP_START
D;JNE

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

