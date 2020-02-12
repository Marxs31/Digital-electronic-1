
   | **A** | **NOT** |
   | ------------- | ------------- |
   | 0 | 1 |
   | 1 | 0 |

   | **A** | **B** | **AND** | **NAND** |
   | ------------- | ------------- | ------------- | ------------- |
   | 0 | 0 | 0 | 1 |
   | 0 | 1 | 0 | 1 |
   | 1 | 0 | 0 | 1 |
   | 1 | 1 | 1 | 0 |

   | **A** | **B** | **OR** | **NOR** |
   | ------------- | ------------- | ------------- | ------------- |
   | 0 | 0 | 0 | 1 |
   | 0 | 1 | 1 | 0 |
   | 1 | 0 | 1 | 0 |
   | 1 | 1 | 1 | 0 |

   | **A** | **B** | **XOR** | **XNOR** |
   | ------------- | ------------- | ------------- | ------------- |
   | 0 | 0 | 0 | 1 |
   | 0 | 1 | 1 | 0 |
   | 1 | 0 | 1 | 0 |
   | 1 | 1 | 0 | 1 |
    
    
## Scheme
<img src="https://github.com/Marxs31/Digital-electronics-1-/blob/master/Labs/01-gates/scheme.png" />

<a href="https://www.codecogs.com/eqnedit.php?latex=f_{AND}&space;=&space;\overline&space;{\overline&space;{&space;\overline&space;{a&space;}\cdot\overline{b}}&space;\cdot&space;\overline&space;{b\cdot&space;\overline{c}}}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?f_{AND}&space;=&space;\overline&space;{\overline&space;{&space;\overline&space;{a&space;}\cdot\overline{b}}&space;\cdot&space;\overline&space;{b\cdot&space;\overline{c}}}" title="f_{AND} = \overline {\overline { \overline {a }\cdot\overline{b}} \cdot \overline {b\cdot \overline{c}}}" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=f_{OR}&space;=&space;\overline&space;{&space;\overline&space;{a&space;}&plus;b}&space;&plus;&space;\overline&space;{\overline{b}&plus;&space;c}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?f_{OR}&space;=&space;\overline&space;{&space;\overline&space;{a&space;}&plus;b}&space;&plus;&space;\overline&space;{\overline{b}&plus;&space;c}" title="f_{OR} = \overline { \overline {a }+b} + \overline {\overline{b}+ c}" /></a>

 | **A** | **B** |**C** | ![equation](https://latex.codecogs.com/gif.latex?f) | ![equation](https://latex.codecogs.com/gif.latex?f_%7BAND%7D) | ![equation](https://latex.codecogs.com/gif.latex?f_%7BOR%7D) |
    | :-: | :-: | :-: | :-: | :-: | :-: |
    | 0 | 0 | 0 | 0 | 1 | 0 |
    | 0 | 0 | 1 | 0 | 1 | 0 |
    | 0 | 1 | 0 | 1 | 1 | 1 |
    | 0 | 1 | 1 | 0 | 0 | 0 |
    | 1 | 0 | 0 | 1 | 0 | 1 |
    | 1 | 0 | 1 | 1 | 0 | 1 |
    | 1 | 1 | 0 | 1 | 1 | 1 |
    | 1 | 1 | 1 | 0 | 0 | 0 |
