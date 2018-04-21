# Navigation and Routers

* angular-cli generate
    
    `ng g c products/product-detail.component --flat`

* **routerLink**

    `www.server.com/products`  HTML 5 style url, requires web server configure with URL rewriting.

    `www.server.com/#/products` Hash style routing

* Route definintion:
```typescript
...
{ path: 'products', component: ProductListComponent }
...
```
Dispaly at:
```html
<route-outlet></route-outlet>
``` 
## 1. import RouteModule in appModule
```typescript
...
    imports: [
        ...
        RouterModule.forRoot([], {useHash: true}),
        ...
    ]
...
```

## 2. configure route
**no leading slash on path**

| path | example |
| --- | --- |
| 'products' | /products |
| 'product/:id' | /product/5 |
| '' | default route |
| '**' | everything else |
* **order matters**
* `redirectTo` for redirect route
* routed component does not need selector

## 3. route in action
```html
<ul class='nav nav-bar'>
    <li [routerLink]="['/welcome', param1, param2, ...]">
    Home
    </li>
</ul>
```

## 4. place the views
```html
<route-outlet></route-outlet>
```

| Nested Component | Routed Component |
| --- | --- |
| define a selector | no selector |
| nest in another component | configure routes |
| no route | tie route to actions |

# Additional Navigation and Routing
* ## Passing params to a route
    * In route config: 
    ```typescript
    {path: 'products/:id', component: ProductDetailComponent }
    ```
    * In navigation component: 
    ```html
    <a [routerLink]="['/products', product.id]"></a>
    ```
    * Reading the param 
    ```typescript
    import { ActivatedRoute } from '@angular/router';
    ...
        constructor(private _route: ActivatiedRoute) {
            console.log(this._route.snapshot.paramMap.get('id));
        }
    ...
    ```
    **snapshot:** no change expected
    **observable:** expected to change, like next button.

* ## Activating a route with code
    ```typescript
    import { Router } from '@angular/router';
    ...
        constructor(private _router: Router) {}
        onBack(): void {
            this._router.navigate(['products']);
        }
    ...
    ```

* ## Protecting routes with Guards

| type of Guards | description |
| --- | --- |
| `CanActive` | Guard navigate to a route |
| `CanDeactive` | Guard navigate from a route |
| `Resolve` | Prefetch data before activating a route |
| `CanLoad` | Prevent async routing |

* **Create Guard**
```typescript
import { Injectable } from '@angular/core';
import { CanActive } from '@angular/router';
@Injectable
export class ProductGuardService implements CanActive {
    canActive(): boolean {
        ...
    }
}
```

* **Register Guard**
Register in appModule as provider
```typescript
...
    providers: [ProductGuardService]
...
```

* **Use Guard**
Use in route configuration
```typescript
    ...
    { path: 'products', canActive:[ProductGuardService], component: ProudctSomeComponent }
    ...
```
**Full example**
```typescript
import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, Router } from '@angular/router';
@Injectable
export class ProductGuardService implements CanActive {
    constructor(private _router: Router) {}
    canActivate(route: ActivatedRouterSnapshot): boolean {
        let id = +route.url[1].path;
        if (isNaN(id) || id < 1 ) {
            //in real world, redirect to error page
            console.log('invalid id');
            this._router.navigate(['products']);
            return false;
        }
        return true;
    }
}
```

# Angular Modules
* ### What is an angular module?
    * a class with `ngModule` decoration
    * aggregate and re-import
    * can be lazy loading
* ### In a module
    * Imports
    * Exports
    * Providers
    * Declarations
    * Bootstrap

## Bootstap array
```typescript
    ...
    // start component
    bootstrap: [AppComponent]
    ...
```

## Declarations array
```typescript
    ...
    // components, directives, pipes inside the module
    declarations: [some1, some2 ]
    ...
```

## Exports array
* export components, directives, pipes for other moudles to use
* never export services

## Imports array
imports external modules

## Providers array
* providers on angualr module are global
* providers on component only visible to the component and its children
* Guards need be added to providers

* **BrowserModule only imports in the RootModule(AppModule)**
* **RouteModule.forRoot should be used in RootModule(AppModule). It will**
     1. register router service 
     1. declare router directive
     1. expose configured routes
* **RouteModule.forChild should be used in feature module, it only does 2,3 above.**

# Shared Module
* Export everything inside for re-use.
* Also export its imports
* Can import external module even not in its imports