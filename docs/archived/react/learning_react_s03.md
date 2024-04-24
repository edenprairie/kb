# Pure React

## Page Setup

## The Virtual DOM

## React Elements
* `React.createElement`
* `data-reactroot` will always appear as an attribute of the root element of your React component.

## ReactDOM
* ReactDom contains the tools to render React elements into browser.
* `ReactDOM.render`

## Children
* ReactDOM only allow render single element to doucment. But the single element can nest children.
* `className` in React will render to HTML as css `class`

## Contructing Elements with Data
```javascript
var list = [
  "one", "two", "three", "four"
]

React.createElement("ul",
  { className: "someCssClass" },
  list.map(
    (item, i) => 
      React.createElement("li", { key: i }, item) //li need a unique key
  )
)
```
## React Components
### React.createClass
* `React.createClass` may deprecate in future
### React.Component
* es6
```javascript
class SomeComponent extends React.Component {
  ...
}

```
### Stateless Functional Components
* Stateless functional components are functions, not objects; therefore, they do not have a “this” scope.
* Functions for only to rendering.
* Pass data using props
## DOM Rendering
## Factories
* Using createFactory to create an h1
```javascript
React.DOM.h1(null, "Baked Salmon") //first arg is for properties, second is for the children
```

# React with JSX
## React Elements as JSX
### JSX Tips
* Nested Components
* className will generate HTML `class=""` for css style.
* Javascript expression wrappered in `{ }`, and will evaluated.
* Mapping array to JSX:
```javascript
<ul>
  {this.props.ingredients.map((ingredient, i) =>
    <li key={i}>{ingredient}</li>
  )}
</ul>
```
### Recipes as JSX
```javascript
// The data, an array of Recipe objects
var data = [ ... ];
// A stateless functional component for an individual Recipe
const Recipe = (props) => (
...
)
// A stateless functional component for the Menu of Recipes
const Menu = (props) => (
...
  <Recipe ...
...
)
// A call to ReactDOM.render to render our Menu into the current DOM
ReactDOM.render(
<Menu recipes={data} title="Delicious Recipes" />,
document.getElementById("react-container")
)
```
## Babel
* presets
## Intro to Webpack
* Code splitting
* Minification
* Feature flagging
* Hot Module Replacement

### Webpack loaders
* install web pack and dependencies
```
sudo npm install -g webpack
npm install babel-core babel-loader babel-preset-env babel-preset-react babel-preset-stage-0 --save-dev
npm install react react-dom --save
```

### Webpack configuration
* `webpack.config.js`
```javascript
module.exports = {
  entry: "./src/index.js",
  output: {
    path: "dist/assets",
    filename: "bundle.js" //output dist/assets/bundle.js
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /(node_modules)/,
        loader: ['babel-loader'],
        query: {
          presets: ['env', 'stage-0', 'react']
        }
      }
    ]
  }
}
```

### Loading the bundle
* index.html
```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>React Recipes App</title>
  </head>
  <body>
    <div id="react-container"></div>
    <script src="assets/bundle.js"></script>
  </body>
</html>
```

* **Others: source mapping, build css and so on.**
* **use `create-react-app` instead**
