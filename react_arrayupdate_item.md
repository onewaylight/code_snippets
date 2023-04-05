```javascript
// sample data structure
/* const data = [
  {
    id:   1,
    name: 'john',
    gender: 'm'
  }
  {
    id:   2,
    name: 'mary',
    gender: 'f'
  }
] */ 
// make sure to set the default value in the useState call (I already fixed it)

const [data, setData] = useState (
  [
    {
      id:   1,
      name: 'john',
      gender: 'm'
    }
    {
      id:   2,
      name: 'mary',
      gender: 'f'
    }
  ]
);

const updateFieldChanged = index => e => {
  console.log('index: ' + index);
  console.log('property name: '+ e.target.name);
  let newArr = [...data]; 
  // copying the old datas array
  // a deep copy is not needed as we are overriding the whole object below, and not setting a property of it. this does not mutate the state.
  newArr[index] = e.target.value; 
  // replace e.target.value with whatever you want to change it to

  setData(newArr);
}

return (
  <React.Fragment>
    {data.map((datum, index) => {
      <li key={datum.name}>
        <input type="text" name="name" value={datum.name} onChange={updateFieldChanged(index)}  />
      </li>
    })}
  </React.Fragment>
)
```


```javascript

setData(datas => ({
  ...data,
  [index]: e.target.value
}))
```

```javascript
  const initial_data = [
    {
      id: 1,
      name: "john",
      gender: "m",
    },
    {
      id: 2,
      name: "mary",
      gender: "f",
    },
  ];

  const [datas, setDatas] = useState(initial_data);

  return (
    <div>
      {datas.map((data, index) => (
        <li key={index}>
          <input
            type="text"
            value={data.name}
            onChange={(e) => {
              data.name = e.target.value;
              setDatas([...datas]);
            }}
          />
        </li>
      ))}
    </div>
  );
```


<h2>
react.dev descriped examples
</h2>

```javascript
import { useState } from 'react';

let initialCounters = [
  0, 0, 0
];

export default function CounterList() {
  const [counters, setCounters] = useState(
    initialCounters
  );

  function handleIncrementClick(index) {
    const nextCounters = counters.map((c, i) => {
      if (i === index) {
        // Increment the clicked counter
        return c + 1;
      } else {
        // The rest haven't changed
        return c;
      }
    });
    setCounters(nextCounters);
  }

  return (
    <ul>
      {counters.map((counter, i) => (
        <li key={i}>
          {counter}
          <button onClick={() => {
            handleIncrementClick(i);
          }}>+1</button>
        </li>
      ))}
    </ul>
  );
}
```

<br>
---

<br>

```javascript
// App.js
import { useState } from 'react';
import './App.css';

function App() {
  const datas = [
    {
      id: 1,
      name: 'Nick',
      age: 21
    },
    {
      id: 2,
      name: 'Lara',
      age: 30
    }
  ];

  const [data, setData] = useState(datas);

  const updateState = (index) => (e) => {
    const newArray = data.map((item, i) => {
      if (index === i) {
        return { ...item, [e.target.name]: e.target.value };
      } else {
        return item;
      }
    });
    setData(newArray);
  };

  return (
    <div className="App">
      <p>Hello, world!</p>
      {data.map((datum, index) => {
        <li key={datum.name}>
          <input
            type="text"
            name="name"
            value={datum.name}
            onChange={updateState(index)}
          />
        </li>;
        })}
    </div>
  );
}

export default App;
```

<br>

---
<br>

<h2> Another Method </h2>

```javascript
import { useState } from "react";

const List = () => {
  const [todos, setTodos] = useState([
    { id: 1, task: "gym", isComplete: false },
    { id: 2, task: "tan", isComplete: false },
    { id: 3, task: "laundry", isComplete: false },
  ]);

  const handleMarkComplete_step1 = (id) => {

    const currentTodoIndex = todos.findIndex((todo) => todo.id === id);
    const updatedTodo = Object.assign({}, todos[currentTodoIndex]);
    updatedTodo.isComplete = true;

    const newTodos = todos.slice();
    newTodos[currentTodoIndex] = updatedTodo;
    setTodos(newTodos);
  };


  const handleMarkComplete_step2 = (id) => {

    const currentTodoIndex = todos.findIndex((todo) => todo.id  === id);

    const updateTodo = { ...todos[currentTodoIndex], isComplete: true};

    const newTodos = [..todos];

    newTodos[currentTodoIndex] = updatedTodo;
    setTodos(newTodos);
  };


  const handleMarkComplete_step3 = (id) => {

    const currentTodoIndex = todos.findIndex((todo) => todo.id === id);

    const updatedTodo = { ...todos[currentTodoIndex], isComplete: true};

    const newTodos = [
      ...todos.slice(0, currentTodoIndex),
      updateTodo,
      ...todos.slice(currentTodoIndex + 1)
    ];
    setTodos(newTodos);
  }

  const handleMarkComplete_final = (id) => {
    const newTodos = todos.map((todo) => {
      if (todo.id === id) {
        return { ...todos, isComplete: true};
      }
      return todo;
    })
  };


  return (
    <div>
    {
      todos.map((todo) => (
        <div
          key={todo.id}
          onClick={() => handleMarkComplete(todo.id)}
        >
          {todo.task}
        </div>
      ))
    }
    </div>
  )
}
```


