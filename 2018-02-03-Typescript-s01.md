# Install & config
* `npm i -g typescript` **OR** `yarn global add typescript`
* `tsc app.ts` transpile app.ts to app.js

## TS project file
**`tsconfig.json`**
* compiler options
* include/exclude files
* support configuration inheritence
```javascript
{
    "compilerOptions": {
        "target": "es5",
        "noUnusedLocals": true,
        ...
    },
    "files": [
        app.ts,
        ...
    ]
}
```
**useful compiler options**
* sourceMap: true  //good for debug
* watch: true //watch source code change
* outDir: "js" //specify the build output directory
* strictNullCheck: true //do not allow assign null to other type like string

## Create project file using command line
`ts --init`

## Multiple project files and inheritence
You can have multiple tsconfig.json on different folder
To inherient a base config file:
add 
```javascript
extends: 'some-base-tsconfig.json', 
``` 
on the project(tsconfig.json) file.

## VScode configure task
F1 -> task:configure task runner

# Built-in types
* Boolean
* Number
* String
* Enum
* Array
* Void
* Null
* Undefined
* Never
* Any

## var, let and const
* `var`: hoisting.
* `let`: no hoisting.
* `const`: cannot change once assigned

## Union type
```typescript
let value: number | string; //value is number or string
```

## Type assertion
```typescript
let value: any = 5;
let fixed: string = (<number>value).toFixed(4);
let fixed2: string = (value as number).toFixed(4);
```
**not type conversion, just ease with type: enable intellisense.**

## non-null assertion operator
* compiler option: `strictNullCheck` added null check.
* use uion type work with legacy js
* use non-null assertion operator work with legacy js:
    ```typescript
    let msgElement: HTMLElement | null = document.getElementById("message");
    msgElement!.innerText = "OK"; //!. just ignore the null check while compile.
    ```

## Compiler type analysis
```typescript
...//with above code
if (msgElement == null) {
    return msgElement; //compiler take msgElement type as null
} else {
    console.log(msgElement); //compiler take msgElement type as HTMLElement
    msgElement = ... //compiler take msgElement type as HTMLElement | null again.
 }
```

# Better functions with typescript
```typescript
function someFunc(s: number, message?: string): string {
    ...
}
//here message is optional param
```

**compilerOption: `noImplicitAny`** 

## Default param
```typescript
function someGreeting(greeting: string = 'hello'): void {
    ...
}
someGreeting();
someGreeting('this is also ok');
```

## Arrow function
```typescript
(message: string) => {
    console.log(message);
}

//same as 
(message: string) => console.log(message);

//same as the following except arrow function is anonymous
function someName(message: string): void  {
    console.log(messgae);
}
```

## Function type
```typescript
let logMessage = (message: string) => console.log(message);

function logError (error: string): void {
    console.error(error)
}

let logger: (value: string) => void; 
/* define logger as a function:
function will take a string param return void. 
function type is: (value: string)=> void
*/

//usage: it works since logError, logMessage are same type
if (thereAreError) {
    logger = logError;
} else {
    logger = logMessage
}
```

# Creating and using customized types

## Interface
```typescript
interface Employee{
    name: string;
    title: string;
}

interface Manager extends Emplyee {
    department: string;
    scheduleMeeting: (topic: string) => void;
}


## Strcutural type system
```typescript
//with about code 
let developer = {
    name: "some-name",
    title: "some-title",
    editor: "waht?"
}

let newEmployee: Employee = developer;
//this works, newEmployee will copy name, title from developer
```

## Class
* Members can be: 
    * public
    * private
    * protected

**class members are public by default**

class inheritence
```typescript
class Developer {
    ...
}

class WebDeveloper extends Developer {
    ...
}
```

## Implementing an interface
```typescript
interface Employee {
    name: string;
    title: string;
    logID: () => string;
}

class Engineer implements Employee {
    name: string;
    title: string;
    logID() {
        return `${this.name}_${this.title}`;
    }
}
```

## Typescript file reference
```typescript
// <reference path="person.ts"/>
```
In `tsconfig.json`, set `compilerOptions` -> `outFile: "some file"`, compiler will pack all referenced file together in a single js file.

## Static members
```typescript
class SomeClass {
    static value: string = '1,2,3';
    ...
}
SomeClass.value="456";
```

## Constructor
```typescript
class SomeImplClass extends SomeBaseClass {
    readonly age: number; //same as C# readonly
    constructor(param: number) {
        super(); //same as C# or Java
        this.age = param; //readonly can only set in constructor
    }
}

class Game {
    constructor (public name: string) { //same as Angular :)
        ...
    }
 }
```

