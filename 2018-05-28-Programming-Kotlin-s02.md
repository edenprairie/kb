# OOP in Kotlin
## Classes
* By default empty constructor will be generated
```kotlin
class Deposit { }
```
* Primary constructor
```kotlin
class Person(val name: String, val age: Int) { }
```
* unless you want, no `constructor` keyword needed, the follwing case you need it:
```kotlin
class Database internal constructor(connection: Connection) { } //internal constructor
```
* construction code placed in `init` method:
```kotlin
class Persion(val name: String, val age: Int?) {
    init {
        require(name.trim().length > 0) {"invalid name"}
        //require will throw illegalArgumentException, if the expression is false
        if (age !=null ) {
            require(age > 0 && age < 150) {"invalid age"}
        }
    }
}

//name, age are properties
//var: read/write
//val: readonly 
```
* if no `var` or `val` in constructor argument, no property generated:
```kotlin
class Person2(firstName: String, lastName: String, howOld: Int?) {
    private val name: String
    private val age: Int?
    init {
        this.name = "$firstName, $lastName"
        this.age = howOld
    }

    fun getName(): String = this.name
    fun getAge(): Int? = this.age
}
```

## Access Levels
* **internal**: within module
* **private**: within file or same class
* **protected**: sub classes

## Nested Classes
* keyword `inner` make nested class private


## Data Classes
* simlimar to POJO, simply hold data
* when use with JPA, use gradle plug in `kotlin-jpa` to generate default construct

## Enum Classes
* simple 
```kotlin
enum class Day { MON, TUE, WED, THU, FRI, SAT, SUN }
```
* with data
```kotlin
enum class Planet(val mass: Double, val radius: Double) {
    MECURY(3.3+e23, 2.4e6),
    EARTH(5.97+e24, 6.3e6)
}
Planet.valueOf("EARTH") //String to enum
Planet.values() //list all values
```
* implement interface
```kotlin
interface Printable {
    fun print(): Uint
}

public enum class Word: Printable {
    HELLO {
        override fun print() {
            ...
        }
    },
    BYE {
        override fun print() {
            ...
        }
    }

}
```

## Static methods and companion object
* no `static` keyword in kotlin
* top level / package level function compiles to static method with a final class which compiled from the kotlin file
* top level / package level object compiles to static class instance, its method compiles to static method.
*  companion object: class + top level object

## Interfaces
```kotlin
interface Doc {
    //properties
    val version: String
    val size: Long
    val name: String
    get() = "No Name" //default implementation
    fun save(input: InputStream)
    fun getDescription(): String {
        return "simple doc";
    } //default implementation
}
```

## Inherientance
* `open` keyword means allwo to derive, by default is open
* only inherient from **one class**, but **multple interfaces**
* no need to list class first
```kotlin
class C: IA, B, ID { }
//IA, ID interfaces
//B, class
``` 

## Visibility modifiers

## Abstract classes

## Polymorphism
* implicit `open`
* explicit `override`
* can override property:
```kotlin
open class Base {
    open val prop1: String
    get() = "Base::value"
}

class Derived: Base() {
    override val prop1: String
    get() = "Derived::value"
}

class Another(override val prop1: String): Base() { }
```
* can override `val` to `var`, but not the reverse way.

## Inheritance vs composition

## Class delegation

## Sealed classes
* sealed class in kotlin is an abstract class, which can be extended by subclasses defined as nested classes within the sealed class itself.
```kotlin
sealed class IntBinaryTree {
    class EmptyNode: IntBinaryTree()
    class IntBinaryTreeNode(val ...) {

    }
}

//usage:
val tree = IntBinaryTree.IntBinaryTreeNode(...)

```
