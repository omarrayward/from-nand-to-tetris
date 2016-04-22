def push_D_to_stack():
    """
    Assigns value of D to head of stack.
    It also increases stack poitner by 1
    """
    return ('@SP\n' +
            'M=M+1\n' +
            'A=M-1\n' +
            'M=D\n')


def load_stack_head_to_D():
    return ('@SP\n' +
            'AM=M-1\n' +
            'D=M\n' +
            'M=0\n')
