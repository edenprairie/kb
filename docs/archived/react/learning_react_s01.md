# Emerging Javascript
## Declare variables in ES6
* `const`
* `let`
* Template strings aka interpolation
* Default parameters
* Arrow functions

## ES6 Objects and Arrays

### Destructuring Assignment
* General
```javascript
var sandwitch = {
  bread: "dutch crunch",
  meat: "tuna",
  cheese: "swiss",
  topping: ["lettuce", "tomato", "mustad"]
}

var {bread, meat} = sandwitch
console.log(bread, meat) //dutch crunch tuna

bread = "garlic"
meat = "turkey"
console.log(bread) //gralic
console.log(meat) //turkey
console.log(sandwitch.bread, sandwitch.meat) //dutch crunch tuna
```

* On function argument
```javascript
var regularPerson = { firstname: "Bill", lastname: "Willson" }
var lordifyOld = regularPerson => {
  console.log(`${regularPerson.firstname} of Canterbury`)
}
lordifyOld(regularPerson) //Bill of Canterbury

var logdifyNew = ({firstname}) => {
  console.log(`${firstname} of Canterbury`)
}
lordifyNew(regularPerson) //Bill of Canterbury
```

* On array
```javascript
var [firstResort] = ["Kirkwood", "Squaw", "Alpine"]
const.log(firstrResort) //Kirkwood

//pass unnessary elements
var [, , thirdResort] = ["Kirkwood", "Squaw", "Alpine"]
console.log(thirdResort) //Alpine
```

### Object Literal Enhancement
* Kind of reverse against destrucuring.
```javascript
var name = "Tallac"
var elevation = 9738

var funHike = [name, elevation]
console.log(funHike) // { name: "Tallac", elevation: 9738 }

var print = function() {
  console.log(`Mt ${this.name} is ${this.elevation} feet tall`)
}

var funHike2 = [name, elevation, print]
funHike2.print() //Mt Tallac is 9738 feet tall
```

* Old vs new syntax
```javascript
//old
var skier = {
  name: name,
  sound: sound,
  powerYell: function() {
    ...
  },
  speed: function(mph) {
    ...
  }
}

//new
var skier = {
  name,
  sound,
  powerYell() {
    ...
  },
  speed(mph) {
    ...
  }
}
``` 

### The spread operator
* Spread arrays
```javascript
var peaks= ["Tallac", "Ralston", "Rose"]
var canyons = ["Ward", "Blackwood"]
var tahoe = [...peaks, ...canyons]
console.log(tahoe.join(", ")) //Tallac, Ralston, Rose, Ward, Blackwood
```

* Spread does **COPY**
```javascript
var peaks = ["Tallac", "Ralston", "Rose"]
var [last] = peaks.reverse()
console.log(last) //Rose
console.log(peaks) //Rose, Ralston, Tallac
```
with spread:
```javascript
var peaks = ["Tallac", "Ralston", "Rose"]
var [last] = [...peaks].reverse() //it copies!
console.log(last) //Rose
console.log(peaks) //Tallac, Ralston, Rose
```
* Used on object
```javascript
var morning = {
  breakfast: "oatmeal",
  lunch: "peanut butter and jelly"
}

var dinner = "mac and cheese"

var backpackingMeals = {
  ...morning,
  dinner
}

console.log(backpackingMeals) // { breakfast: "oatmeal", lunch: "peanut butter and jelly", dinner: "mac and cheese"}
```

## Promise
```javascript
const getFakeMembers = count => new Promise((resolves, rejects) => {
  ...
  //some actions, resolves, rejects are callbacks
})

//usage:
getFakeMembers(5).then(
  data => console.log(data), //callback: resolves
  err => console.err(...) //callback: rejects
)
```

## Classes
* ES6 introduces class. 
```javascript
class Vacation { //by convention data type starts with uppercase
  constructor(destination, length) {
    this.destination = destination
    this.length = length
  }

  print() {
    console.log(...)
  }
}
//usage:
const trip =  new Vacation("some place", 5)
trip.print()
```
* Class can be extend/inheritance
```javascript
class Expedition extends Vacation {
  constructor(dest, length, gear) {
    super(dest, length)
    this.gear = gear
  }

  print() {
    super.print()
    console.log("...some other stuff ...")
  }
}
```
**ES6 class use prototypal inherientance**

## ES6 Modules
* `export`
* `export default`
* `import`
* `import A as B`
* `import *`

## CommonJS
```javascript
const print(message) => log(message, new Date())
const log(message, timestamp) => console.log(`${timestamp.toString()}: ${message}`)
module.exports = {print, log} //CommonJS export

//CommonJs use require not import
const {log, print} = require('./file.js')
```


