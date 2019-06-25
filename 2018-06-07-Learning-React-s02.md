# Functional Programming with JavaScript

## What it means to be functional
* **High order functions** functions that take function as arguments and/or return function as return value

## Imperative vs Declarative
* Declarative example:
```javascript
const ladAndMapMembers = compose(
    conbineWith(sessionStorage, "members"),
    save(sessionStorage, "members"),
    scopeMembers(window),
    logMemberInfoToConsole,
    logFieldsToConsole("name.first"),
    countMembersBy("location.state"),
    prepStatesForMapping,
    save(sessionStorage, "map"),
    renderMap
)

getFakeMembers(100).then(loadAndMapMembers)
```

## Functional Concepts
### Immutability
* argument  passing are by reference, it is mutable
```javascript
let color_lawn = {
    title: "lawn",
    color: "#00FF00",
    rating: 0
}

function rateColor(color, rating) {
    color.rating = rating
    return color
}
console.log(rateColor(color_lawn, 5).rating) //5
console.log(color_lawn.rating) //5, it changed!

//Object.assign, make copy
var rateColorImmutable = function(color, rating) {
    return Object.assign({}, color, {rating: rating})
}

console.log(rateColorImmutable(color_lawn, 2).rating) //2
console.log(color_lawn.rating) //5, it remains!

//better: with ES7 spread operator
var rateColorBetter = (color, rating) => ({
    ...color,
    rating
})
```

* `Array.push` is not an immutable function, `Array.concat` is
```javascript
let list = [
    { title: "1" },
    { title: "2" },
    { title: "3" },
]

var addColor = function(title, colors) {
    colors.push({title: title})
    return colors
}
console.log(addColor("4", list).length) //4
console.log(colors.length) //4

var addColorImmutable = (title, array) => array.concat({title}) //also new code style
console.log(addColorImmutable("5", list).length) //5
console.log(colors.length) //4

```

### Pure Functions
Pure function have the following:

* return value based on it arguments
* take at lease 1 argument, always return a value or function
* do not cause side effect, set global variables, or change anything about application state
* treat its arguments as immutable data

**Pure functions are naturally testable**

### Data Transformations
* Data transform should produce copies of transformed data and leave input immutable.
* Useful functions: `Array.join`, `Array.filter`, `Array.map`, `Array.reduce`
* `Object.keys` returns object property names
* `Array.reduceRight` same as `Array.reduce` but process from the end of the array


### High Order Functions
* High order functions take function as arguments and/or retuen function as return value.
* `Array.map`, `Array.filter`, `Array.reduce` are high order functions

* **Currying**: is the practice of holding on to some of the values needed to complete an operation until the rest can be supplied at a later point. This is archived by the use of a function returns another function: curried function.
```javascript
const userLogs = username => messages =>  
    console.log(`${username} -> ${message}`) 
    //userLogs is high order function, 
    //message => is the  curried funciton?

const log = userLogs("grandpa23")    

log ("attemped to load 20 fake members")
getFakeMembers(20).then(
    members => log(`successfully loaded ${members.length} members`)
    error => log("encounter an error while loading members")
)

//grandpa23 -> attemped to load 20 fake members
//grandpa23 -> successfully loaded 20 members
```

### Recursion
* function recall itself.
```javascript
const countDown = (value, fn) => {
    fn(value)
    return (value > 0) ? countDown(value-1, fn) : value
}

countDown(10, value => console.log(value))
//10
//9
//8
...
//1
//0
```
* a useful recursive function demo
```javascript
const deepPick = (fields, object={}) => {
    const [first, ...remaining] = fields.split(".")
    return (remaining.length) ? deepPick(remaining.join("."), object[first]) : object[first]
}

var dan = {
    type: "person",
    data: {
        gender: "male",
        info: {
            id: 22,
            fullname: {
                first: "Dan",
                last: "Deacon"
            }
        }
    }
}

deepPick("type", dan) //person
deepPick("data.info.fullname.last") //Deacon
```

### Composition
* Different composition patterns
```javascript
//chain:
const ctime=a.replace('s', '1')
  .replace('t', '2')
  .replace('v', '2')

//function compsition
const both = functionOne(functionTwo(arg))

//function as args
const all = putAll(function1, function2, function3)
```

### Put it all together
* Keep data immutable
* Keep functions pure - accept at least one argument, return data or anthoter function
* Use recursion over looping(when possible)


