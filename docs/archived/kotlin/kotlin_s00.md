# Programming with Objects

## Interfaces
### classes and interfaces
* defined in a similar way to Java
* public by default
```kotlin
interface Signatory {
    fun sign()
}

class Person: Signatory {
    override fun sign() {}
}
```

## Classes
### Primary Constructor
* defined in-line
* no `new` keyword
```kotlin
class Person(val: name: String)

val kevin = Person("Kevin")
```

### Properties
* `val` is immutable, provides get method
* `var` is mutable, getters and setters
```kotlin
class Person(val name: String, var age: Int)
```

### Open
* classes are final by default(unlike Java). `open` make it can be derived
```kotlin
interface Signatory {
    fun sign()
}

open class Person(val name: String, var age: Int) : Signatory {
    override fun sign() = println("$name aged $age can sign documents")
}

class Student(name: String, age: Int): Person (name, age) {

}
```

### Init
* init block runs after object is constructed
```kotlin
open class Person(val name: String, var age:Int) {
    init() {  }
}
```

### Secondary Constructors
* can provide more than one constructor
```kotlin
open class Person(val name: String, var age: Int){
    var isMarried: Boolean
    constructor (name: String, age: Int, isMarried: Boolean): this(name, age) {
        this.isMarried = isMarried
    }
} 
```
* **no `val` or `var` for secondary constructor params.**

### Prefer default values
* only provide more than one constructor if you are deriving from a class that requires it.
```kotlin
open class Person(val name: String, var age: Int, var isMarried: Boolean = false) {
    ...
}
```
## Companion Objects
### No statics in Kotlin
* use the companion object instead
```kotlin
class Program {
    companion object {
        @JvmStatic //?
        fun main(val args: Array<String>) {

        }
    }
}
``` 
* The companion objects are singletons within our class definition,  so we can associate data and functionality across all our instances of a class.

## Properties
* declare member in class

## Data Classes
### Data Classes
* classes only hold data
* `data` keyword
* Kotlin provides equals, hashCode, toString (and other) functions
```kotlin
data class User(var name: String, var last: String)

class Person(var first: String, val last: String)

fun main(args: Array<String>) {
    val tom = User("tom", "peter")
    println(tom)
    tom.last = "kk"
    tom.name = "was"
    println(tom)

    val p = Person("1", "2")
    println(p)
    p.first = "CCC"
    //p.last = "WWW" //last is readonly
    println(p)

}
```