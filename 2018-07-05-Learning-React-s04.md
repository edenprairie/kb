# Props, State, and the Component Tree

## Property Validation
* automatic property validation

| Type | Validator |
| --- | --- | 
| Arrays | React.PropTypes.array |
| Boolean | React.PropTypes.bool |
| Funcitons | React.PropTypes.func |
| Numbers | React.PropTypes.number |
| Objects | React.PropTypes.object |
| Strings | React.PropTypes.string |

### Validating props with the createClass
```javascript
const Summary = createClass({
  ...
  propTypes: {
    ingredients: PropTypes.array,
    steps: PropTypes.array,
    title: PropTypes.string
  },
  render() {
    ...
```

### Default props
* to avoid warning caused by validation on initial value
```javascript
const Summary = createClass({
...
  propTypes: {
    ingredients: PropTypes.number,
    steps: PropTypes.number,
    title: PropTypes.string
  },
  getDefaultProps() {
    return {
      ingredients: 0,
      steps: 0,
      title: "[recipe]"
    }
  },
  render() {
```

### Custom Property Validation
* all prop validators are functions:
```javascript
propTypes: {
  ingredients: PropTypes.number,
  steps: PropTypes.number,
  title: (props, propName) =>
    (typeof props[propName] !== 'string') ?
      new Error("A title must be a string") :
      (props[propName].length > 20) ? 
        new Error(`title is over 20 characters`) : null
}
```