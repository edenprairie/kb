# Angluar Basics
* '`' is called ES2015 backtick
* use VSCode Intellisense

# Directives
* *ngIf
* *ngFor
```HTML
<tr *ngFor='let product of products'>
</tr>
```

let ... of - iterate objects
let ... in - iterate indexes

# Binding
* ## Interpolation
```
{{ production.name }}
``` 

* ## Property Binding
```HTML
<img [src]='product.url' [style.width.px]='myWidth'></img>
```
Favor property binding over interpolation, except expression, like
```
{{ 'hello' + user.name }}
```

* ## Event Binding
```HTML
<button (click)='someHandler()'></button>
```

* ## Two Way Binding
```HTML
<input [(ngModel)]='someProp'>
```
ngModel exists in FormsModule

# Pipes
pipe do transform data

* In interpolation:
```
{{ name.last | uppercase }}
```

* In property binding:
```
<img [title]='product.name | lowercase'>
```

* pipe with args:
```
{{ myData | myPipe: 'arg1' : 'arg2' : 'arg3' : ... }}
```

# Interfaces
```TypeScript
export interface IProduct {
    id: string;
    name: string;
    getDiscount(percent: number) : number;
}
```
Class implements interface

# Encapsulate Component Styles
using `styles` ot `styleUrls` in @Component

# Component Lifecycle Hooks
lifecycle:
create -> render -> create and render children -> process changes (multple interations) ->destroy

## Most used hooks (defined as interfaces):
* onInit: used for initial load, ngOnInit()
* onChanges: handle input properties, ngOnChange()
* onDestroy: clean up, ngOnDestroy

# Customize Pipe
```TypeScript
@Pipe({
    name: 'removeSpace'
})

export class RemoveSpacePipe implements PipeTransform {
    transfor(...) {
        ...
    }
} 
```
* **need declare in appModule**
* **put into shared folder**



