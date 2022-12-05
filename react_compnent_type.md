```js

import Child from "./components/Child";

function App() {
  return (
    <div className="App">
      <Child
        name="Lee"
        age={20}
        email="d!@email.com"
        isMarried={false}
      />
    </div>
  )
}
```

```js
function Child({ name, age, email, isMarried }) {
  return (
    <>
      <h1>{name}</h1>
      <h2>{age}</h2>
      <h3>{email}</h3>
      <h4>{isMarried ? "Yes" : "No" }</h4>
    <>
  );
}

Child.propTypes = {
  name: PropTypes.string,
  age: PropTypes.number,
  email: PropTypes.string,
  isMarried: PropTypes.bool,
};

export default Child;
```