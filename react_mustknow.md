
## Arrow Functions
```js
function DoSomething() {

}


const DoSomething = () => {

}
```

```js

// Function declaration syntax
function MyComponent(props) {
  return <div>{props.content}</div>;
}

// Arrow function syntax
const MyComponent = (props) => {
  return <div></div>
}

// Arrow function syntax(shorthand)
const MyComponent = props => <div>{props.content}</div>;
```

```js
<button onClick={() => {
  console.log("hello world");
}}>
```


## Short Conditionals: &&, ||, Ternary Operator

```js
import React from "react";

function App() {
  const isLoggedIn = true;

  // If true: Welcome back!, if false: nothing
  return <div>{isLoggedIn && "Welcome back!"}</div>;
}

export default App;
```

### Nullish coalescing operator(??)


```js
  let age = 10;
  let name = "Dohwan";

  if ( age > 10) {
    name = "Dohwan";
  } else {
    name = "Jack";
  }
```

```js
let name = age > 10 && "Dohwan";

let name = age > 10 || "Dohwan";
```

## Objects

## Array Method: Map, Filter, Reduce

## Async-Await, Promises, Fetch

## Object Destructuring

<br>

# Promises + Async/Await Synatax

```js
import React, { useState, useEffect } from 'react';

const App = () => {
  const [ avatar, setAvatar] = useState('');

  useEffect(() => {
    fetch("")
      .then(response => response.json())
      .then(data => setAvatar(data.avatar_url))
      .catch(error => console.error("Error fetching data: ", error));
  }, []);

  return (
    <img src={avatar} alt="Reed Barger" />
  );
};
```

```js
/* Go to react.new and paste this code in to see it work! */
import React from "react";

const App = () => {
  const [avatar, setAvatar] = React.useState("");

  useEffect(() => {
    /* 
	  Note that because the function passed to useEffect cannot be async, we must create a separate function for our promise to be resolved in (fetchAvatar)
    */
    async function fetchAvatar() {
      const response = await fetch("https://api.github.com/users/reedbarger");
      const data = await response.json();
      setAvatar(data.avatar_url);
    }

    fetchAvatar();
  }, []);

  return <img src={avatar} alt="Reed Barger" />;
};

export default App;
```

```js
/* Go to react.new and paste this code in to see it work! */
import React, { useEffect, useState } from "react";

const App = () => {
  const [avatar, setAvatar] = useState("");

  useEffect(() => {
    async function fetchAvatar() {
      /* Using an invalid user to create a 404 (not found) error */
      const response = await fetch("https://api.github.com/users/reedbarge");
      if (!response.ok) {
        const message = `An error has occured: ${response.status}`;
        /* In development, you'll see this error message displayed on your screen */
        throw new Error(message);
      }
      const data = await response.json();

      setAvatar(data.avatar_url);
    }

    fetchAvatar();
  }, []);

  return <img src={avatar} alt="Reed Barger" />;
};

export default App;
```

<br>

# ES Modue Import / Export Syntax

> constants.js
```js
export const name = "Reed";

export const age = 28;

export default function getName() {
  return name;
}
```
<br>

> app.js
```js
import getName, { name, age } from "./constants.js";

console.log(name, age, getName());
```
<br>

> constants.js
```js
const name = "Reed";

const age = 28;

function getName() {
  return name;
}

export { name, age };
export default getName;
```
<br>

> app.js

```js
import getName, { name, age } from './constants.js';

console.log( name, age, getName());
```
<br>

```js
const name = "Reed";

const age = 28;

function getName() {
  return name;
}

export { name, age };
export default getName;
```
<br>

> app.js
```js
import getByName, { name as myName, age as myAge } from './constants.js";

console.log(myName, myAge, getMyName());
```


# References

https://www.freecodecamp.org/news/javascript-skills-you-need-for-react-practical-examples/

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing