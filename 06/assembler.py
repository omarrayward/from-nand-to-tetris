# Example: python assembler.py "max/Max.asm"

import sys

if __name__ != '__main__':
    print 'Please run as a self-conatined program'

symbols = {
    'R0': 0,
    'R1': 1,
    'R2': 2,
    'R3': 3,
    'R4': 4,
    'R5': 5,
    'R6': 6,
    'R7': 7,
    'R8': 8,
    'R9': 9,
    'R1O': 10,
    'R11': 11,
    'R12': 12,
    'R13': 13,
    'R14': 14,
    'R15': 15,
    'SCREEN': 16384,
    'KBD': 24576,
    'SP': 0,
    'LCL': 1,
    'ARG': 2,
    'THIS': 3,
    'THAT': 4
}
next_address = 16


def remove_comments_and_whitespace(line):
    without_comments = line.split('/')[0]
    return without_comments.replace(' ', '')


def get_instructions(hack_filename):
    hack_text = open(hack_filename, 'r')

    instructions = []
    for line in hack_text.read().split('\r\n'):
        stripped = remove_comments_and_whitespace(line)
        if stripped:
            instructions.append(stripped)

    return instructions


def parse_symbol(symbol):
    global next_address
    if symbol not in symbols:
        symbols[symbol] = next_address
        next_address += 1

    return symbols[symbol]


def int_to_bin(num, bit_size=16):
    bin_num = bin(num)[2:]
    return (bit_size - len(bin_num)) * '0' + bin_num


def parse_a_instruction(instruction):
    address = instruction[1:]
    try:
        return int_to_bin(int(address))
    except ValueError:
        return int_to_bin(parse_symbol(address))


def get_bin_comp(comp):
    return {
        '0': '0101010',
        '1': '0111111',
        '-1': '0111010',
        'D': '0001100',
        'A': '0110000',
        '!D': '0001101',
        '!A': '0110001',
        '-D': '0001111',
        '-A': '0110011',
        'D+1': '0011111',
        'A+1': '0110111',
        'D-1': '0001110',
        'A-1': '0110010',
        'D+A': '0000010',
        'D-A': '0010011',
        'A-D': '0000111',
        'D&A': '0000000',
        'D|A': '0010101',
        'M': '1110000',
        '!M': '1110001',
        '-M': '1110011',
        'M+1': '1110111',
        'M-1': '1110010',
        'D+M': '1000010',
        'D-M': '1010011',
        'M-D': '1000111',
        'D&M': '1000000',
        'D|M': '1010101'
    }[comp]


def get_bin_dest(dest):
    dest_list = ['0', '0', '0']
    if not dest:
        return ''.join(dest_list)
    if 'A' in dest:
        dest_list[0] = '1'
    if 'D' in dest:
        dest_list[1] = '1'
    if 'M' in dest:
        dest_list[2] = '1'
    return ''.join(dest_list)


def get_bin_jmp(jmp):
    if not jmp:
        return '000'
    return {
        'JGT': '001',
        'JEQ': '010',
        'JGE': '011',
        'JLT': '100',
        'JNE': '101',
        'JLE': '110',
        'JMP': '111'
    }[jmp]


def parse_c_instruction(instruction):
    bin_output = '111'
    dest = None
    jmp = None

    if '=' in instruction:
        [dest, instruction] = instruction.split('=')
    if ';' in instruction:
        [comp, jmp] = instruction.split(';')
    else:
        comp = instruction

    bin_output += get_bin_comp(comp)
    bin_output += get_bin_dest(dest)
    bin_output += get_bin_jmp(jmp)
    return bin_output

##################--------- DRIVER CODE  -------######################  # NOQA

try:
    hack_filename = sys.argv[1]
except IndexError:
    sys.exit('Please add a .asm file as an argument of the assembler')

# 1. Get a list of instructions from input file
instructions = get_instructions(hack_filename)

# 2. Loop through the instructions and store the loops in the symbols table
counter = 0
for idx, val in enumerate(instructions):
    if val[0] == '(' and val[len(val) - 1] == ')':
        loop = val.replace('(', '').replace(')', '')
        symbols[loop] = idx - counter
        counter += 1

# 3. Create the output by modifying the extension of the input file
filename = hack_filename.split('.asm')[0]

output_file = filename + '.hack'
output = open(output_file, 'w')


# 4. Convert each instruction in its binary representation and write it to
# the output file
for instruction in instructions:
    if instruction[0] == '(':
        continue

    elif instruction[0] == '@':
        binary_instruction = parse_a_instruction(instruction)

    else:
        binary_instruction = parse_c_instruction(instruction)

    output.write(binary_instruction + '\r\n')
