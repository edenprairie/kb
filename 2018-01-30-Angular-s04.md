# Angular Cli
* `ng v`
* `ng help`
* `ng new`

**polyfills.ts supports old browser**

* `ng new hello-world --prefix hw`
* `ng serve`
* `ng serve -o` //opens default browser

## ng generate
|  assets | command |
| --- | --- |
| class | `ng g cl` |
| component | `ng g c` |
| directive | `ng g d` |
| enum | `ng g e` |
| guard | `ng g g` |
| interface | `ng g i` |
| module | `ng g m` |
| pipe | `ng g p` |
| service | `ng g s` |

* `ng test`
* `ng ese`
* `ng build`
* `ng build --prod`
    * minify/uglify
    * tree shaking, remove unused branchs and pieces
    * AOT: ahead of time compiler
* `ng build --base-herf`

#Typesctipt

## Typescript optional property in interface
```typescript
interface {
    name: string;
    age? string; //optional
}
```
**by default, Typescript class members are public**
