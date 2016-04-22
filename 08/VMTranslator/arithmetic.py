from helpers import load_stack_head_to_D

label_counter = 0


def _prepare_for_binary():
    """
    Loads the first 2 entries of stack to D and M
    """
    return (load_stack_head_to_D() +
            '@SP\n' +
            'A=M-1\n')


def _prepare_for_unary():
    """
    Loads the first entry of stack to D and M
    """
    return ('@SP\n' +
            'A=M-1\n')


def _add_handler():
    return (_prepare_for_binary() +
            'M=D+M\n')


def _sub_handler():
    return (_prepare_for_binary() +
            'M=M-D\n')


def _and_handler():
    return (_prepare_for_binary() +
            'M=D&M\n')


def _or_handler():
    return (_prepare_for_binary() +
            'M=D|M\n')


def _compare(assembly_comp):
    """
    """
    # Use label_counter to create different labels
    global label_counter

    true_label = 'TRUE_{}'.format(label_counter)
    false_label = 'FALSE_{}'.format(label_counter)
    continue_label = 'CONTINUE_{}'.format(label_counter)
    label_counter += 1
    return (_prepare_for_binary() +
            'D=M-D\n' +
            '@{}\n'.format(true_label) +
            'D;{}\n'.format(assembly_comp) +
            '@{}\n'.format(false_label) +
            '0;JMP\n' +
            '(' + true_label + ')\n' +
            '@SP\n' +
            'A=M-1\n' +
            'M=-1\n' +
            '@{}\n'.format(continue_label) +
            '0;JMP\n' +
            '(' + false_label + ')\n' +
            '@SP\n' +
            'A=M-1\n' +
            'M=0\n' +
            '@{}\n'.format(continue_label) +
            '0;JMP\n' +
            '(' + continue_label + ')\n')


def _eq_handler():
    return _compare('JEQ')


def _gt_handler():
    return _compare('JGT')


def _lt_handler():
    return _compare('JLT')


def _neg_handler():
    return (_prepare_for_unary() +
            'M=-M\n')


def _not_handler():
    return (_prepare_for_unary() +
            'M=!M\n')


def arithmetic_handler(type):
    return '// {} \n{}'.format(type, {
        'add': _add_handler,
        'sub': _sub_handler,
        'neg': _neg_handler,
        'eq': _eq_handler,
        'gt': _gt_handler,
        'lt': _lt_handler,
        'and': _and_handler,
        'or': _or_handler,
        'not': _not_handler
    }[type]())
