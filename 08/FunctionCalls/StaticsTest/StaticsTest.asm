@256
D=A
@SP
M=D

// call fn Sys.init with locals 0
@continuation_Sys.init
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
// label continuation_Sys.init
(continuation_Sys.init)

// declare Class1.set with locals 0// label Class1.set
(Class1.set)

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

// pop from statck to static 0
@SP
AM=M-1
D=M
M=0
@Class1.vm_0
M=D
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

// pop from statck to static 1
@SP
AM=M-1
D=M
M=0
@Class1.vm_1
M=D
// push constant 0 
@0
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

// declare Class1.get with locals 0// label Class1.get
(Class1.get)

// push from static 0 to stack 
@Class1.vm_0
D=M
@SP
M=M+1
A=M-1
M=D

// push from static 1 to stack 
@Class1.vm_1
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

// declare Class2.set with locals 0// label Class2.set
(Class2.set)

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

// pop from statck to static 0
@SP
AM=M-1
D=M
M=0
@Class2.vm_0
M=D
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

// pop from statck to static 1
@SP
AM=M-1
D=M
M=0
@Class2.vm_1
M=D
// push constant 0 
@0
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

// declare Class2.get with locals 0// label Class2.get
(Class2.get)

// push from static 0 to stack 
@Class2.vm_0
D=M
@SP
M=M+1
A=M-1
M=D

// push from static 1 to stack 
@Class2.vm_1
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

// push constant 6 
@6
D=A
@SP
M=M+1
A=M-1
M=D

// push constant 8 
@8
D=A
@SP
M=M+1
A=M-1
M=D

// call fn Class1.set with locals 2
@continuation_Class1.set
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
@2
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
// go handler Class1.set
@Class1.set
0;JMP
// label continuation_Class1.set
(continuation_Class1.set)

// pop from stack to register 5
@SP
AM=M-1
D=M
M=0
@5
M=D
// push constant 23 
@23
D=A
@SP
M=M+1
A=M-1
M=D

// push constant 15 
@15
D=A
@SP
M=M+1
A=M-1
M=D

// call fn Class2.set with locals 2
@continuation_Class2.set
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
@2
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
// go handler Class2.set
@Class2.set
0;JMP
// label continuation_Class2.set
(continuation_Class2.set)

// pop from stack to register 5
@SP
AM=M-1
D=M
M=0
@5
M=D
// call fn Class1.get with locals 0
@continuation_Class1.get
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
// go handler Class1.get
@Class1.get
0;JMP
// label continuation_Class1.get
(continuation_Class1.get)

// call fn Class2.get with locals 0
@continuation_Class2.get
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
// go handler Class2.get
@Class2.get
0;JMP
// label continuation_Class2.get
(continuation_Class2.get)

// label WHILE
(WHILE)

// go handler WHILE
@WHILE
0;JMP

