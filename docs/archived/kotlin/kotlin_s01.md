# Starting with Kotlin
* to speed up comile, in `build.gradle` add the following:
```
kotlin.incremental=true
```

# Kotlin Basics

## val and var
## Type inference
* compile tries to figure out the type:
```kotlin
val someLong = 123456L
```

## Basic Types
### Numbers : Long, Int, Short, Byte, Double, Float
* Bitwise operation:
```kotlin
val leftShift = 1 shl 2
val rightShift = 1 shr 2
val unsignedRightShift = 1 ushr 2

val and = 1 and 0x00001111
val or = 1 or 0x00001111
val xor = 1 xor 0x00001111
val inv = 1.inv() 
```

### Boolean
### Chars
### Strings
### Arrays
```kotlin
val array = arrayOf(1,2,3)
val perfectSquares = Array(10, {k -> k*k}) //size and generator
```
* to avoid boxing use: ByteArray, CharArray, ShortArray, IntArray, LongArray, BooleanArray, FloatArray, DoubleArray

## Comments
## Packages
## Imports
### Wildcard Imports
### Import Renaming
```kotlin
import com.jenac.here as there
```
## String templates / interpolation
```kotlin
"hi, this is ${someVariableValue}"
```

## Ranges
```kotlin
val aToZ = "a".."z"
val isTure = "c" in aToZ
val oneToNine = 1..9
val isFalse = 11 in oneToNine
```
* downTo(), rangeTo()
```kotlin
val countingDown = 100.downTo(2)
val rangeTo = 10.rangeTo(20)
```

* step()
```kotlin
val oneToFifty = 1..50
val oddNumbers = oneToFifty.step(2)
```

* reversed()
```kotlin
val countingDownEvenNumbers = (2..100).step(2).reversed()
```

## Loops
* while
```kotlin
while(true) {
    ...
}
```

* for
```kotlin
val list = listOf(1, 2, 3, 4)
for (k in list) {
    ...
}

val set = setOf(1,2)
for (s in set) {
    ...
}

for (a in 1..50) {
    ...
}
```
* **ranges are handled by index for better performance**
* for works on any iterable
* Array can also use indices extension
```kotlin
for (index in array.indices) {
    println("element $index is ${array[index]})")
}
```

## Exception Handling
* all exceptions in kotlin is unchecked

## Instantiating Classes
* no `new` key word
```kotlin
val file = File("someFolder/someFile")
```

## Referential equality and Structual equality
* referential equality: use `===` or `!==`
* structual equality: use `==` or `!=`

## This expression
* In member of class, `this` refers to the class instance
* In extensions,   `this` refers to the instance that extension function was applied to:
```kotlin
class C {
    ...
}

fun C?.toString() {
    if (this == null) return "null"
    return "the actual value"
}
```

### Scope
* label
```kotlin
class Building (val address: String) {
    inner class Reception(telephone: String) {
        fun printAddress() = println(this@Building.address)
    }
}
```

## Visibility modifiers
### private
* private top level function, class, interface only visible within the same file
* in class, only visible within the class

### protected
* not allowed for top level

### internal
* visible in same module

## Control flow as expression
* expression vs statement: expression is evaluable, statement is not
* `if...else` and `try...catch` are expressions
```kotlin
val date = Date()
val today = if (date.year == 2018) true else false

fun isZero(x: Int): Boolean {
    return if (x==0) true else false
}

val success = try {
    readFile()
    true
} catch (e: IOException) {
    false
}
```
**when use `if` as expression, must have `else` to cover all the cases**

## Null syntax
* nullable must explicit:
```kotlin
val s:String? = null //ok
val s:String = null //compile error
```
* `is` for type checking:
```kotlin
fun isString(any: Any): Boolean {
    return if (any is String) true else false
}
```

### smart cast
* compiler is intelligent to figure out type:
```kotlin
//when check length, compiler can tell any is String 
fun isEmptyString(any: Any): Boolean {
    return any is String && any.length == 0
}

fun isNotStringOrEmpty(any: Any): Boolean {
    return any !is String || any.length == 0
}
```

### explicit casting
* `as`
```kotlin
val s = any as String
```
* if cannot cast, `ClassCastException` will be thrown
* if want return null when cannot cast, declare with nullable:
```kotlin
val any = "someFolder/someFile"
val string: String? = any as String //ok, success cast
val file: File? = any as File //ok, file is null now.
``` 

## When expression
### when (value)
* like `switch` in Java
```kotlin
fun what(x: Int) {
    when(x) {
        0 -> println("zero")
        1 -> println("one")
        else -> println("ok")
    }
}

```
**when must cover all the cases, use `else` or make sure all cases are covered.**
* use as an expression
```kotlin
fun isMinOrMax(x: Int): Boolean {
    val isIt = when (x) {
        Int.MAX_VALUE -> true
        Int.MIN_VALUE -> true
        else -> false
    }
    return isIt
}

//this is better
fun isZeroOrOne(x: Int): Boolean {
    return when(x) {
        0, 1 -> true
        else -> false
    }
}
```

* use function as a case
```kotlin
fun isAbs(x: Int): Boolean {
    return when(x) {
        Math.abs(x) -> true
        else -> false
    }
}
```

* use range
```kotlin
fun isSingleDigit(x: Int): Boolean {
    return when(x) {
        in -9..9 -> true
        else -> false
    }
}
```

* in list
```kotlin
fun isDieNumber(x: Int): Boolean {
    return when(x) {
        in lisfOf(1,2,3,4,5,6) -> true
        else -> false
    }
}
```

* type checking
```kotlin
fun startsWithFoo(any: Any): Boolean {
    return when(any) {
        is String -> any.startsWith("Foo")
        else -> false
    }
}
```

### when without argument
* `if ... else` like style
```kotlin
fun whenWithoutArgs(x: Int, y: Int) {
    when {
        x<y -> println ("x is less than y")
        x>y -> println ("x is greater than y")
        else -> println ("x == y")
    }
}
```

## Function return

* By default, `return` returns from the nearest enclosing function or anonymous function.
```kotlin
fun printLessThanTwo() {
    val list = listOf(1,2,3,4)
    list.forEach{ fun(x) {
        if (x<2) println(x)
        else return //just return the internal function
        }
        println("this line still prints for 3 and 4")
    }
}
```

* use label to return outside function
```kotlin
fun printUntilStop() {
    val list = listOf("a", "b", "stop", "c")
    list.forEach {
        if (it == "stop") return @forEach
        else println(it)
    }
}
```

## Type hierarchy
* `Any` is like `Object` in Java, it is base class for all others types. It defines `toString`, `hashCode`, `equals`, `apply`, `let`, `to`.

* `Unit` like `void`, but it is a singleton

* `Nothing` is subclass for all other types
