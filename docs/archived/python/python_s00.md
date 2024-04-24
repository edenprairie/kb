# Python 3

### Basic
* **divide**
4/3

* **integer divide**
4//3

* **power**
4**3

* **mod**
4%3

* **string repeat**
'abc ' * 3

`'abc abc abc '`

* **esacpe**
\

### String
* **string index from 0, back index starts with -1**
'abc'[0]
`'a'`
'abc'[-1]
`'c'`

* **range using `:`**
'abc'[1:4]
`'bc'`
'abc123'[1:4]
`'bc1'`
'abc123'[1:]
`'bc123'`
'abc123'[:4]
`'abc1'`
'abc123'[:]
`'abc123'`

* **get string length**
len('1234')
`4`

* **clear screen**
```python
import os
os.system('clear')
```

### List
* **add**
[1,2,3] + ['four', 'five', 'six']
`[1, 2, 3, 'four', 'five', 'six']`
* **append**
* **range also works**
* **can assign value using range**
Empty a list:
`someList[:]=[]`


### if
* **examples**
```python
age = 18
if age < 3:
    print('milk')
    print('water')
elif age < 21:
    print('g2')
else:
    print('beer')

name = 'batman'
if name is 'superman':
    print('S')
elif name is 'batman':
    print('B')
else:
    print('unknown')
```

### for
```python
foods = ['pizza', 'wendy\'s', 'tuna', 'beer', 'somalica']

//for f in foods[:3]:
for f in foods:
    print(f)
    print(len(f))
print('--------------')
print(f)
```

### range
```python
for x in range(10):
    print(x)
```
print 0 to 9

**range(start, end, step)**    
```python
for x in range(30, 40, 2):
    print(x)
```
prints: 30, 32, 34, 36, 38


### while
```python
age = 5
while age < 15:
    print(age)
    age += 1
```

### Comment
single line:
```python
# this is comment
```
multiple line
```python
'''
this is multiple
line comment
'''
```

### print concatenation
```python
print(10, 12, 'my age is:' , 9, 100, 'what')
```
prints:10 12 my age is: 9 100 what

### `break`

### `continue`
```
numbersTaken = [2, 5, 7, 9, 12, 15, 17]
for n in range(1, 20):
    if n in numbersTaken:
        continue
    print(n)
```

### Functions   
```
#define function
def functionBeef():
    print('beef started')
    print('beef working')
    print('beef end')

#call the function
functionBeef()
```
```
#returns a list
def bitcoin_to_usd(btc):
    amount = btc * 200
    print(amount)
    return [btc, amount]

bitcoin_to_usd(2.5)
```

### default parameter value
```
def get_gender(sex = 'unkown'):
	...
```

### variable scope
same as other language

### keyword arguments aka named parameters
```
def sayhello(system='linux', action='say', word='hello') :
    print(system, action, word)

sayhello()
sayhello(action='print')
sayhello( word='good bye', system='windows')
```

### packed arguments like arg_list in C++
```
def print_numbers(*numbers):
    for n in numbers:
        print(n)

print_numbers()
print_numbers(1)
print_numbers(1, 2, 3, 5)
print_numbers([2,3,5,6,7]) #this will print [2, 3, 5, 6, 7]
```
to pack dictionary use **
```
# A Python program to demonstrate packing of
# dictionary items using **
def fun(**kwargs):
    # kwargs is a dict
    print(type(kwargs))

    # Printing dictionary items
    for key in kwargs:
        print("%s = %s" % (key, kwargs[key]))


# Driver code
fun(name="geeks", ID="101", language="Python")
```

### unpack arguments
```
def health_calculator(age, apples_ate, cigs_smoked):
  answer = (100-age) + (apples_ate*3.5) - (cigs_smoked*2)
  print(answer)

buckys_data = [27, 20, 0]

health_calculator(buckys_data[0], buckys_data[1], buckys_data[2])
health_calculator(*buckys_data) #using unpacking arguments
```

### sets
no duplicate
```
groceries = {'pizza', 'candy', 'coke', 'banana', 'coke'}
print(groceries) #only 1 coke printed. duplicate coke removed

#check exist
print('pizza' in groceries)
print('apple' in groceries)
```

### dictionary
```
classmates = {'Tony': ' cool but smells', 'Emma': ' sits behind me', 'Lucy': ' asks too many questions'}

print(classmates['Emma'])

classmates['Emma'] = ' what if?'
for k, v in classmates.items():
    print(k + ':' + v)
```

### modules
```
import random 
print(random.randrange(0, 100))
```

### download image from web
```
import urllib.request
urllib.request.urlretrieve(url, filename)
```

### read and write files
* write file
```
fw = open('sample.txt', 'w')
fw.write('some lines in file\n')
fw.write('some lines 2 in file\n')
fw.close()
```
* read file
```
fr = open('sample.txt', 'r')
text = fr.read()
print(text)
fr.close()
```

### some notes
```
request.urlopen(url)
csv_str.split("\\n")
#raw string
file = r'C:\hello\this.txt'
```

### exception 
```python
try:
	number = int(input("what is your number?\n"))
	print(18/number)
except ValueError:
	print("please input a number")
except ZeroDivisionError:
	print("no zero allow")
except:
	print("all other exception goes here.")
finally:
	print("always go here")
```

### classes and objects
```python
class User:
    first = '1'
    last = 'b'

    def printFullName(self):
        print(self.first + '.' + self.last)


u = User()
u.printFullName()

u2 = User()
u2.first = '2'
u2.last = 'c'
u2.printFullName()
```

### init (like construct)
```python
class Tuna:
	def __init__(self):
		#some implementation here
```

### class variable vs instance variable
```python
class Girl:
	gender = 'female' #class variable, like C# static member, shared by all class instance.

	def __init__(self, the_name):
		self.name = the_name #name is the instance variable. Like member variable in C#

r  = Girl('Rachel')
print(r.name)
print(r.gender)
```

### inheritance
```python
class Parent():
	def print_last_name:
		pass
		#some implementation
	def print_awsome:
		pass
		#some other implementation

class Child(Parent): #inherit from parent
	def print_first_name:
		#bbbbb
	def print_awsome:
		#override the parent method
```

### multiple inheritance are supported
```
pass
#used for empty implementation
```

### threading
