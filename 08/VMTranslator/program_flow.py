from helpers import load_stack_head_to_D


def label_handler(label):
    return ('// label {}\n'.format(label) +
            '({})\n'.format(label))


def goto_handler(label):
    return ('// go handler {}\n'.format(label) +
            '@{}\n'.format(label) +
            '0;JMP\n')


def if_goto_handler(label):
    return ('// goto handler {}\n'.format(label) +
            load_stack_head_to_D() +
            '@{}\n'.format(label) +
            'D;JNE\n')
