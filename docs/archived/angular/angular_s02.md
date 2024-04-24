# Nested Components
* `@Input()` Parent -> Child
* `@Output()` Parent <- Child, using event

### **Usage**
1. delcare in appModule
2. put selector in parent component
3. input data in parent use property binding

**@Input example**
* In Parent:
```HTML
...
    <td>
        <pm-star [rating]='product.stars'>
        </pm-star>
    </td>
...
```
* In Child:
```typescript
export class StarComponent {
    @Input() rating: number;
    ...
}
```

**Rasing event using @Output**
* In Child:
```typescript
export class StarComponent {
    ...
    @Output() someName1: EventEmitter<string> = 
        new EventEmitter<string>();
    
    handleClick() {
        this.someName1.emit('the value'); //string which is the EventEmitter<_>
    }
}
```
```html
...
    <div (click)='handleClick()' >
    </div>
...
```

* In Parent:
```html
...
    <pm-star [rating]='product.stars' 
        (someName1)='onChildNotify($event)'>
    </pm-star>
...
```
```typescript
export class ParentComponent {
    ...
    onChildNotify(message: string) : void {
        ...
    }
}
```

# Service and Dependency Injection
* ## Building a service
create the injectable class
```typescript
import { Injectable } from '@angular/core';
@Injectable()
export class ProductService {
    getProducts(): IProduct[] {
        ...
    }
}
```

* ## Register a servcie
    * define provider in appModule (can be used in whole app) or Component (can be used in itself and its children)
    * if defined as provider more than once, it then have multiple instances (not singleton any more)
    * use as singleton is preferred

* ## Inject a service
use constructor injection
```typescript
...
    constructor(private _productService: ProductService) {
    }
...
```

# Retrive Data using HTTP

* ## Observables and Reactive Extensions
    * manage sync data
    * treat events as collection
    * use reactive extensions(RxJS) no relation with REACT
    * supports Observale operators: map, filter, take, merge ...

* ## Promise vs Observables

| Promise | Observable |
| --- | --- |
| provides a single future value | emits multiple values over time |
| not lazy | lazy |
| not cancellable | cancellable |
| | supports operators |

* **HttpClient exists in HttpClientModule**
* import it in appModule

In appModule:
* imports means reference modules outside appModule
* declarations means reference class/components inside appModule

**Example**
```typescript
@Injectable()
export class ProductService {
    private _url:string = 'some-url';
    constructor(private _http: HttpClient) {

    }

    getProducts(): Observable<IProduct[]> {
        return this._http.get<IProducrt[]>(this._url);
    }
}
```

* ## Exception Handling
```typescript
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/do';
...
        return this._http.get<IProduct[]>(this._url)
            .do(data => console.log(data))
            .catch(this.handleError);
...

    private handleError(err: HttpErrorResponse) {
        //some code
        console.log(err.message);
        //or you can re-throw
        return Observable.throw(err.message)'
    }
...
```

* ## Subscribe to an Observable
```typescript
x.then(valueFn, errorFn) //Promise
x.subscribe(valueFn, errorFn) //Observable
x.subscribe(valueFn, errorFn, completeFn) //Observable
let s = x.subscribe(valueFn, errorFn, completeFn) //Observable
s.unsubscribe() //unsubscribe a Observable
```
**Example**
```typescript
...
    ngOnInit(): void {
        this._productService.getProducts()
            .subscribe(
                products => this.products = products,
                error => this.errorMessage = <any>error //since handleError do re-throw;
            );
    }
...
```

