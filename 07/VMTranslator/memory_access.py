from helpers import load_stack_head_to_D, push_D_to_stack


ARGUMENT = 'argument'
CONSTANT = 'constant'
LOCAL = 'local'
POINTER = 'pointer'
STATIC = 'static'
TEMP = 'temp'
THAT = 'that'
THIS = 'this'


BIN_SEGMENT_FOR_ASM_SEGMENT = {
    ARGUMENT: 'ARG',
    LOCAL: 'LCL',
    THAT: 'THAT',
    THIS: 'THIS'
}


def _push_constant_to_stack(val):
    """
    Stores value in stack, incrementing by 1 the value of @SP
    """
    return ('// push constant {} \n'.format(val) +
            '@{}\n'.format(val) +
            'D=A\n' +
            push_D_to_stack())


def _push_from_memory_to_stack(segment, index):
    return ('// push from segment {} to stack {} \n'.format(segment, index) +
            '@{}\n'.format(index) +
            'D=A\n'
            '@{}\n'.format(segment) +
            'A=M+D\n' +  # Pointer arithmetic to index in memory
            'D=M\n' +  # Assign to D the value of current memory index
            push_D_to_stack())


def _push_from_register_to_stack(register):
    return ('@{}\n'.format(register) +
            'D=M\n' +
            push_D_to_stack())


def _push_from_static_to_stack(index, file):
    return ('// push from static {} to stack \n'.format(index) +
            '@{}_{}\n'.format(file, index) +
            'D=M\n' +
            push_D_to_stack())


def push_handler(segment, val, file):
    if segment == CONSTANT:
        return _push_constant_to_stack(val)
    index = val
    if segment in [LOCAL, ARGUMENT, THIS, THAT]:
        bin_segment = BIN_SEGMENT_FOR_ASM_SEGMENT[segment]
        return _push_from_memory_to_stack(bin_segment, index)
    elif segment == POINTER:
        register = str(3 + int(index))
        return _push_from_register_to_stack(register)
    elif segment == TEMP:
        register = str(5 + int(index))
        return _push_from_register_to_stack(register)
    elif segment == STATIC:
        return _push_from_static_to_stack(index, file)
    else:
        raise Exception('Incorrect segment {}'.format(segment))


def _from_stack_to_memory_transporter(segment, index):
    return ('// pop from stack to segment {} {} \n'.format(segment, index) +
            '@{}\n'.format(index) +
            'D=A\n' +
            '@{}\n'.format(segment) +
            'D=D+M\n' +
            '@R13\n' +
            'M=D\n' +  # Store memory index where we want to store in R13
            load_stack_head_to_D() +
            '@R13\n' +
            'A=M\n' +
            'M=D\n')


def _from_stack_to_register_transporter(register):
    return ('// pop from stack to register {}\n'.format(register) +
            load_stack_head_to_D() +
            '@{}\n'.format(register) +
            'M=D')


def _from_stack_to_static_transporter(index, file):
    return ('// pop from statck to static {}\n'.format(index) +
            load_stack_head_to_D() +
            '@{}_{}\n'.format(file, index) +
            'M=D')


def pop_handler(segment, index, file):
    if segment == CONSTANT:
        raise Exception('Incorrect segment {} for pop command'.format(segment))
    if segment in [LOCAL, ARGUMENT, THIS, THAT]:
        bin_segment = BIN_SEGMENT_FOR_ASM_SEGMENT[segment]
        return _from_stack_to_memory_transporter(bin_segment, index)
    elif segment == POINTER:
        register = str(3 + int(index))
        return _from_stack_to_register_transporter(register)
    elif segment == TEMP:
        register = str(5 + int(index))
        return _from_stack_to_register_transporter(register)
    elif segment == STATIC:
        return _from_stack_to_static_transporter(index, file)
    else:
        raise Exception('Incorrect segment {}'.format(segment))
