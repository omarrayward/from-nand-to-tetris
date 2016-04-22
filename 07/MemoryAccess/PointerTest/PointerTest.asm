@256
D=A
@SP
M=D

@3030
D=A
@SP
M=M+1
A=M-1
M=D

@SP
AM=M-1
D=M
M=0
@3
M=D
@3040
D=A
@SP
M=M+1
A=M-1
M=D

@SP
AM=M-1
D=M
M=0
@4
M=D
@32
D=A
@SP
M=M+1
A=M-1
M=D

@2
D=A
@THIS
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

@46
D=A
@SP
M=M+1
A=M-1
M=D

@6
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

@3
D=M
@SP
M=M+1
A=M-1
M=D

@4
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

@2
D=A
@THIS
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
M=M-D

@6
D=A
@THAT
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

