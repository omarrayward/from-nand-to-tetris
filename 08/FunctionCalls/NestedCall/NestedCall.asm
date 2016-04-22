// declare Sys.init with locals 0// label Sys.init
(Sys.init)

// call fn Sys.main with locals 0
@continuation_Sys.main
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@5
D=D-A
@0
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
// go handler Sys.main
@Sys.main
0;JMP
// label continuation_Sys.main
(continuation_Sys.main)

// pop from stack to register 6
@SP
AM=M-1
D=M
M=0
@6
M=D
// label LOOP
(LOOP)

// go handler LOOP
@LOOP
0;JMP

// declare Sys.main with locals 0// label Sys.main
(Sys.main)

// push constant 123 
@123
D=A
@SP
M=M+1
A=M-1
M=D

// call fn Sys.add12 with locals 1
@continuation_Sys.add12
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@SP
D=M
@5
D=D-A
@1
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
// go handler Sys.add12
@Sys.add12
0;JMP
// label continuation_Sys.add12
(continuation_Sys.add12)

// pop from stack to register 5
@SP
AM=M-1
D=M
M=0
@5
M=D
// push constant 246 
@246
D=A
@SP
M=M+1
A=M-1
M=D

// return
@LCL
D=M
@R13
M=D
@5
D=D-A
A=D
D=M
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

// declare Sys.add12 with locals 3// label Sys.add12
(Sys.add12)
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
// push constant 0 
@0
D=A
@SP
M=M+1
A=M-1
M=D
// pop from stack to segment LCL 2 
@2
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

// push constant 12 
@12
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

// return
@LCL
D=M
@R13
M=D
@5
D=D-A
A=D
D=M
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

