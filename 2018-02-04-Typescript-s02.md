# Creating and using typescript module

## Supporting technologies
```
TS -> Typescript compiler -> Javascript Modules -> Loader/Bundler
                             . AMD                 . Node
                             . CommonJs            . RequireJs 
                             . UMD                 . SystemJs
                             . System              . Webpack 
                             . ES2015 
  ```

### Export declarations
```typescript
//person.ts
export interface Person {}
export function hireDeveloper(): void {}
export default class Employee {} 
//when import, if you do not specify what to import, then Employee is imported
class Manager {} //not accessible outsite
```

### Exprot statement
```typescript
//person2.ts
interface Person {}
function hireDevelopr(): void() {}
class Employee {}
class Manager {}
export { Person, hireDeveloper, Employee as Staff };
```

### Importing a module
```typescript
import { Person, hireDeveloper } from './person';
import Worker from './person'; // no {}, import will take defaul export Employee alias as Worker.
import { Staff as CoWorker } from './person2'; //alias again
import * as HR from './person';
HR.hireDeveloper();
```

**compilerOptions: module: commonJs**

### Relative vs non-relative imports
* relative
```typescript
import { Bla } form './bla';
```
* non relative, usually for 3rd party library
```typescript
import * as lodash from 'lodash';
```

**different search path**

### Module resolution strategies
* Classic vs Node
* **compilerOption: traceResolution = true helps trouble shooting**

# Type declaration files

* `*.d.ts`
* DefinitlyTyped on github
* https://microsoft.github.io/TypeSearch/
```bash
npm install --save lodash
npm install --save @types/lodash
```