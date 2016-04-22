import sys
import os
from parser import parse_gen
from starter import program_starter, stack_initializer
from writer import assembly_command_constructor


def _is_file(arg):
    return '.' in arg


def _is_vm_file(file):
    return file.split('.')[1] == 'vm'


def _get_vm_files(arg):
    try:
        arg = arg
    except IndexError:
        raise Exception('Please user a .vm filename or a folder as an '
                        'argument to VMTranslator')

    if _is_file(arg):
        files = [arg]
    else:
        content_in_directory = \
            ['{}/'.format(arg) + content for content in os.listdir(arg)]
        files = [file for file in content_in_directory if _is_file(file)]

    return (file for file in files if _is_vm_file(file))


def _get_output_filename(arg):
    if _is_vm_file(arg):
        return '{}.asm'.format(arg.split('.vm')[0])
    folder_name = arg.split('/')[-1]
    return '{}/{}.asm'.format(arg, folder_name)

##################--------- DRIVER CODE  -------######################  # NOQA

if __name__ != '__main__':
    print 'Please run as a self-conatined program'

vm_files = _get_vm_files(sys.argv[1])
output_file = open(_get_output_filename(sys.argv[1]), 'w')
output_file.write(stack_initializer() + '\n')
output_file.write(program_starter() + '\n')

for file in vm_files:
    parser = parse_gen(file)
    file_name = file.split('/')[-1]
    for command_type, arg1, arg2 in parser:
        assembly_command = \
            assembly_command_constructor(command_type, arg1, arg2, file_name)
        output_file.write(assembly_command + '\n')
