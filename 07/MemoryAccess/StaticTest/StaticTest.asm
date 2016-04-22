@256
D=A
@SP
M=D

@111
D=A
@SP
M=M+1
A=M-1
M=D

@333
D=A
@SP
M=M+1
A=M-1
M=D

@888
D=A
@SP
M=M+1
A=M-1
M=D

@SP
AM=M-1
D=M
M=0
@static_8
M=D
@SP
AM=M-1
D=M
M=0
@static_3
M=D
@SP
AM=M-1
D=M
M=0
@static_1
M=D
@static_3
D=M
@SP
M=M+1
A=M-1
M=D

@static_1
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

@static_8
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

