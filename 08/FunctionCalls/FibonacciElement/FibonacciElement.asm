@256
D=A
@SP
M=D

// call fn Sys.init with locals 0
@continuation_Sys.init_0
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
// go handler Sys.init
@Sys.init
0;JMP
// label continuation_Sys.init_0
(continuation_Sys.init_0)

// declare Main.fibonacci with locals 0// label Main.fibonacci
(Main.fibonacci)

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

// lt 
@SP
AM=M-1
D=M
M=0
@SP
A=M-1
D=M-D
@TRUE_0
D;JLT
@FALSE_0
0;JMP
(TRUE_0)
@SP
A=M-1
M=-1
@CONTINUE_0
0;JMP
(FALSE_0)
@SP
A=M-1
M=0
@CONTINUE_0
0;JMP
(CONTINUE_0)

// goto handler IF_TRUE
@SP
AM=M-1
D=M
M=0
@IF_TRUE
D;JNE

// go handler IF_FALSE
@IF_FALSE
0;JMP

// label IF_TRUE
(IF_TRUE)

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

// label IF_FALSE
(IF_FALSE)

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

// call fn Main.fibonacci with locals 1
@continuation_Main.fibonacci_1
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
// go handler Main.fibonacci
@Main.fibonacci
0;JMP
// label continuation_Main.fibonacci_1
(continuation_Main.fibonacci_1)

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

// call fn Main.fibonacci with locals 1
@continuation_Main.fibonacci_2
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
// go handler Main.fibonacci
@Main.fibonacci
0;JMP
// label continuation_Main.fibonacci_2
(continuation_Main.fibonacci_2)

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

// declare Sys.init with locals 0// label Sys.init
(Sys.init)

// push constant 4 
@4
D=A
@SP
M=M+1
A=M-1
M=D

// call fn Main.fibonacci with locals 1
@continuation_Main.fibonacci_3
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
// go handler Main.fibonacci
@Main.fibonacci
0;JMP
// label continuation_Main.fibonacci_3
(continuation_Main.fibonacci_3)

// label WHILE
(WHILE)

// go handler WHILE
@WHILE
0;JMP

