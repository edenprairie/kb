# Course and books
* Python fundamentals - the python apprentice
* Python beyond the basics - the python jorneyman
* Advance Python - the python master

# Getting starting with python3

* REPL
* `_` means last result

## Significant white spaces rules
* Prefer 4 spaces
* Never mix space and tab
* Be consistent on consecutive lines
* Only deviate to improve readability

# Python standard library

```python
import math
math.sqrt(81)

help()
help(math)
help(math.factorial)

from math import sqrt
sqrt(49)

from math import sqrt as sq
sq(16)
```

* `//` divide into int
* `/` divide into float

# Scalar types and values

## int
```python
0b10 # 2
0o10 # 8
0x10 # 16
int(3.5) # 3
int("489") # 489
int("10000", 3) # 81, 3 is the base
```

## float
*  `3e8` // 3 x 10<sup>8</sup> 
* `1.616e-35` // 1.616 x 10<sup>-35</sup>
* `float("1.618")` // 1.618
* `float("inf")` // infinity: inf

## None
```python
a = None
a is None 'True
```

## bool
* `True` or `False`
* `bool(0)` is `False`
* `bool([])` is `False`
* `bool("")` is `False`

# Condition statement
```python
if expr:
    print("OK")
# empty line is reqired in REPL

if expr:
    doSomething
else
    doSomeOther


if expr:
    some...
elif
    some...
else
    some...

```

# While loops
```python
while expr:
    print
    c-=1


while True:
    if expr:
        break
        
            
```


