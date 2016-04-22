from helpers import load_stack_head_to_D, push_D_to_stack
from program_flow import goto_handler, label_handler

label_counter = 0


def function_handler(function_name, num_locals):
    initialize_locals = ''
    for local in range(int(num_locals)):
        initialize_locals += _push_constant_to_stack(0)
        initialize_locals += _from_stack_to_memory_transporter('LCL',
                                                               str(local))

    return ('// declare {} with locals {}'.format(function_name, num_locals) +
            label_handler(function_name) +
            initialize_locals)


def call_handler(function_name, num_args):
    global label_counter
    continuation_address = 'continuation_{}_{}'.format(function_name,
                                                       label_counter)
    label_counter += 1
    return ('// call fn {} with locals {}\n'.format(function_name, num_args) +
            '@{}\n'.format(continuation_address) +
            'D=A\n' +
            push_D_to_stack() +  # Store return address (caller) in stack
            '@LCL\n' +
            'D=M\n' +
            push_D_to_stack() +  # Store LCL address (caller) in stack
            '@ARG\n' +
            'D=M\n' +
            push_D_to_stack() +  # Store ARG address (caller) in stack
            '@THIS\n' +
            'D=M\n' +
            push_D_to_stack() +  # Store THIS address (caller) in stack
            '@THAT\n' +
            'D=M\n' +
            push_D_to_stack() +  # Store THAT address (caller) in stack
            '@SP\n' +
            'D=M\n' +
            '@5\n' +
            'D=D-A\n' +
            '@{}\n'.format(num_args) +
            'D=D-A\n' +
            '@ARG\n' +  # NOQA Set current ARG address to stack head -5 (state of caller) - num_args (prev pushed to stack)
            'M=D\n' +
            '@SP\n' +
            'D=M\n' +
            '@LCL\n' +
            'M=D\n' +  # Set current LCL address to stack head
            goto_handler(function_name) +
            label_handler(continuation_address)
            )


def return_handler():
    frame_address_pointer = 'R13'  # NOQA temp address used to store the base frame address
    continue_address_pointer = 'R14'  # NOQA temp address used to store the address of
    return ('// return\n'
            '@LCL\n'
            'D=M\n'
            '@{}\n'.format(frame_address_pointer) +
            'M=D\n'  # NOQA Store in frame_address_pointer (temp) the value of LCL (head of stack at beginning of call execution)
            '@5\n'
            'D=D-A\n'  # D now holds the address of return pointer
            'A=D\n'
            'D=M\n'
            '@{}\n'.format(continue_address_pointer) +
            'M=D\n' +  # NOQA Store continuation_address in continue_address_pointer (return address was previously set in call_handler)
            load_stack_head_to_D() +
            '@ARG\n'
            'A=M\n'
            'M=D\n'  # Set ARG [0] to return value of function
            'D=A+1\n'  # Next stack head should be the value of ARG[0] + 1
            '@SP\n'
            'M=D\n'  # NOQA Set stack head to point to one address above where we store the returned value
            '@{}\n'.format(frame_address_pointer) +
            'A=M-1\n'
            'D=M\n'
            '@THAT\n'
            'M=D\n'  # Set the caller's THAT to its previous value
            '@2\n'
            'D=A\n'
            '@{}\n'.format(frame_address_pointer) +
            'D=M-D\n'
            'A=D\n'
            'D=M\n'
            '@THIS\n'
            'M=D\n'  # Set the caller's THIS to its previous value
            '@3\n'
            'D=A\n'
            '@{}\n'.format(frame_address_pointer) +
            'D=M-D\n'
            'A=D\n'
            'D=M\n'
            '@ARG\n'
            'M=D\n'  # Set the caller's ARG to its previous value
            '@4\n'
            'D=A\n'
            '@{}\n'.format(frame_address_pointer) +
            'D=M-D\n'
            'A=D\n'
            'D=M\n'
            '@LCL\n'
            'M=D\n'  # Set the caller's LCL to its previous value
            '@{}\n'.format(continue_address_pointer) +
            'A=M\n'  # Load the return address to continue executing caller
            '0;JMP\n'
            )
