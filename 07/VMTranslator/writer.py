from arithmetic import arithmetic_handler
from command_types import (
    ARITHMETIC, CALL, LABEL, FUNCTION, GOTO, IF, POP, PUSH, RETURN)

from memory_access import pop_handler, push_handler
from subroutine import call_handler, function_handler, return_handler
from program_flow import if_goto_handler, goto_handler, label_handler


def assembly_command_constructor(command_type, arg1, arg2, file):
    try:
        return {
            ARITHMETIC: lambda: arithmetic_handler(arg1),
            PUSH: lambda: push_handler(arg1, arg2, file),
            POP: lambda: pop_handler(arg1, arg2, file),
            GOTO: lambda: goto_handler(arg1),
            IF: lambda: if_goto_handler(arg1),
            FUNCTION: lambda: function_handler(arg1, arg2),
            LABEL: lambda: label_handler(arg1),
            CALL: lambda: call_handler(arg1, arg2),
            RETURN: lambda: return_handler()
        }[command_type]()

    except KeyError:
        raise Exception('Invalid command_type {} for '
                        'assembly_command_constructor'.format(command_type))
