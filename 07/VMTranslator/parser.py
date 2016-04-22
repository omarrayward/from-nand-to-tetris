from command_types import (
    ARITHMETIC, CALL, FUNCTION, GOTO, IF, LABEL, POP, PUSH, RETURN)


def _remove_comments_and_whitespace(line):
    without_comments = line.split('/')[0]
    return without_comments.replace('\r\n', '').strip()


def _get_command_type(split_command):

    try:
        return {
            'add': ARITHMETIC,
            'sub': ARITHMETIC,
            'neg': ARITHMETIC,
            'eq': ARITHMETIC,
            'gt': ARITHMETIC,
            'lt': ARITHMETIC,
            'and': ARITHMETIC,
            'or': ARITHMETIC,
            'not': ARITHMETIC,
            'push': PUSH,
            'pop': POP,
            'goto': GOTO,
            'label': LABEL,
            'if-goto': IF,
            'function': FUNCTION,
            'call': CALL,
            'return': RETURN
        }[split_command[0]]

    except (KeyError, IndexError):
        raise Exception(
            'Invalid vm command: {}'.format(' '.join(split_command)))


def _get_first_arg(split_command, command_type):
    if command_type == RETURN:
        return None
    elif command_type == ARITHMETIC:
        return split_command[0]
    try:
        return split_command[1]
    except IndexError:
        raise Exception(
            'Invalid vm command: {}'.format(' '.join(split_command)))


def _get_second_arg(split_command, command_type):
    if command_type in [PUSH, POP, CALL, FUNCTION]:
        try:
            return split_command[2]
        except (IndexError, ValueError):
            raise Exception(
                'Invalid vm command: {}'.format(' '.join(split_command)))


# ############ Only function to be exported ############ #

def parse_gen(file):
    """
    Generator that outputs a triplete for each command in a `.vm` file
    """
    vm_file = open(file, 'r')

    for line in vm_file.readlines():
        command = _remove_comments_and_whitespace(line)
        if not command:
            continue
        split_command = command.split(' ')
        command_type = _get_command_type(split_command)
        arg1 = _get_first_arg(split_command, command_type)
        arg2 = _get_second_arg(split_command, command_type)

        yield command_type, arg1, arg2
