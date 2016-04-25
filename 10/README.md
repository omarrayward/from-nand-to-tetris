### Compiling .jack into .xml

First part of the Compiler.
In this project we tokenize + parse a .jack file into an .xml
file that will then be used to generate .vm code (project 11)

To run:
`python Compiler <src>`

<src> is either a folder with .jack files or a unique .jack file. The output
would be an .xml file per .jack file.

To compare the expected output with the output file run:

./../tools/TextComparer.sh <expected_output>  <real_output>
(e.g. ../tools/TextComparer.sh Square/SquareGame_output.xml  Square/SquareGame.xml )

The implementation is not done with classes (as suggested in the book), it's
done with functions and generators.

The tokenizer is a generator that is used by the compilation_engine to consume
one token at a time instead of computing all the tokens ahead of time.

The compilation_engine then uses a stack ("token_stack") as a temporary data
store to place the lookahead tokens.

Note that .jack is almost an "LL(0) language" (languages in which the first
token defines the grammar rule to be applied by the compilation engine).

There is only one case (when compiling an expression) that the
compilation_engine needs to lookahead 2 tokens to apply the correct grammar
rule
