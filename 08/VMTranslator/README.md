### Virtual Machine

This is a stack based virtual machine that targets .vm files (byte code) and
translates them into .asm (assembly code).

This solves both project 7 and 8.

The book suggests to implement the functionality with classes but I
implemented it almost entirely with pure functions, limiting the amount of
state that the program holds.

To run:
`python VMTranslator <target>`

target could either be a ".vm" file or a folder conataining multiple ".vm"
files.

The output of the command will be a single ".asm".

To test the output file use the suplied VMEmulator to load both the output and
the test file.
