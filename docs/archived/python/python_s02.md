# Strings and Collections

## Collections
* str
* bytes
* list
* dict

## str
* immutable sequence of unicode code points (chars)
* string literal
```python
'hello world'

"hello world"

"""this is 
a multi-line
string"""

r"c:\users\lchen" #raw string, no need to escape \
str(123) # "123"
```

## bytes
* immutable sequence of bytes
* bytes literal
```python
b'hello world'
b"hello world"
...
```

##list
* **mutable** sequence of objects
* list literal
```python
[1, 2, 3]
["1", "two", 3, 4.0]
```

## dict
* **mutable** mappings of key/value pairs
* dict literal
```python
{ k1: val1, k2: val2 }
{} # empty dict
```

## For Loop
* for item in interable:
```python
colors = ['red': 0xFF0000, 'green': 0x00FF00, 'blue': 0x0000FF]
for color in colors:
    print(color, colors[color])


```

# Modularity
* python code placed in *.py file called module
* modules can be executed directly: `python module_name.py`
* import to REPL `import module_name`
* named function `def function_name(arg1, argn):`
* return value using `return`
* no return value then returns `None`
* use `__name__` to determine how the module is being used
```python
if __name__ == "__main__":
```
* command args: `sys.arv`, script file name is `sys.argv[0]`
* docstring """ .... bla bla .... """ for `help()`
