
## Preparation tasks (done before the lab at home)

1. See [schematic](../../Docs/coolrunner-ii_sch.pdf) or [reference manual](../../Docs/coolrunner-ii_rm.pdf) of the board and find out the connection of 7-segment display. How can you change the position of the character on the display?

2. Complete the decoder conversion table for common anode display. Sketch the symbols to be displayed.

    | **Hex** | **Input** | **a** | **b** | **c** | **d** | **e** | **f** | **g** |
    | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
    | 0 | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
    | 1 | 0001 | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
    | 2 | 0010 | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
    | 3 | 0011 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
    | 4 | 0100 | 1 | 0 | 0 | 1 | 1 | 0 | 0 |
    | 5 | 0101 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
    | 6 | 0110 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
    | 7 | 0111 | 0 | 0 | 0 | 1 | 1 | 1 | 1 |
    | 8 | 1000 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
    | 9 | 1001 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
    | A | 1010 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
    | b | 1011 | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
    | C | 1100 | 0 | 1 | 1 | 0 | 0 | 0 | 1 |
    | d | 1101 | 1 | 0 | 0 | 0 | 0 | 1 | 0 |
    | E | 1110 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
    | F | 1111 | 0 | 1 | 1 | 1 | 0 | 0 | 0 |
