```js
import { useState } from 'react';

function App() {
  const [ email, setEmail ] = useState("");
  const [ password, setPassword ] = useState("");

  function onSubmit(e) {
    e.preventDefault()
    console.log({ email, password })
  }

  return (
    <form onSubmit={onSubmit}>
      <label htmlFor="email">Email</label>
      <input
        value={email}
        onChange={e => setEmail(e.target.value)}
        type="email"
        id="email"
      />
      <label htmlFor="password">Password</label>
      <input
        value={password}
        onChange={ e => setPassword(e.target.value)}
        type="password"
        id="password"
      />
      <button type="submit">Submit</button>
    </form>
  )
}
```

```js
  const emailRef = useRef();
  const passwordRef = useRef();

  function onSubmit(e) {
    e.preventDefault();
    console.log({
      email: emailRef.current.value,
      password: passwordRef.current.value
    })
  }

  <input ref={emailRef} type="email" id="email" />
  <input ref={passwordRef} type="password" id="password" />
```

```js
import { useState } from "react";

export function Counter() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    console.log(count);
  }, [count])

  function adjustCount(amount) {
    setCount((currentCount) => {
      return currentCount + amount;
    })
  }

  return (
    <>
      <button onClick={() => adjustCount(-1)}>-</button>
      <span>{count}</span>
      <button onClick={() => adjustCount(1)}>+</button>
    </button>
  )
}
```

```js
import { Counter } from "./Counter"

function App() {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastNme] = useState("");
  //const [fullName, setFullName] = useState("");

  const fullName = `${firstName} ${lastName}`;

  useEffect(() => {
    fetch("#").then(d => {
      setData(d);
    })
  }, []);

  useEffect(() => {
    console.log(data);
  }, [data]);

  useEffect(() => )

  // useEffect(() => {
  //   setFullName(`${firstName} ${lastName}`);
  // }, [firstName, lastName]);

  return (
    <>
      <input value={firstName} onChange={e => setFirstName(e.target.value)} />
      <input value={lastName} onChange={e => setLastName(e.target.value)} />
      {fullName}
    </input>
  )
}


```


```js
import { useEffect, useState } from "react";

export function Form() {
  const [age, setAge] = useState(0);
  const [name, setName] = useState("");
  const [darkMode, setDarkMode] = useState(false);

  const person = useMemo(() => { 
    return { age, name };
  }, [age, name]);

  useEffect(() => {
    console.log(person);
  }, [person]);

  return (
    <div style={{ background: darkMode ? "#333" : "#FFF" }}>
      Age:{" "}
      <input value={age} type="number" onChange={e => setAge(e.target.value)} />
      <br />
      Name: <input value={name} onChange={e => setName(e.target.value)} />
      <br />
      Dark Mode: {" "}
      <input 
        type="checkbox"
        value={darkMode}
        onChange={e => setDarkMode(e.target.value)}
      />
  )
}


```