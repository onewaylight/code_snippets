```js
const contentComments = {[
  {
    'id': 0,
    'name': 'Name #1',
    'text': "It's my first data",
  }, {
    'id': 1,
    'name': 'Name #2',
    'text': "Hello Are you there?"
  }
]}
```

```js
contentComments.map((list) =>
  <li key={list.id}>
    {list.name}
    {list.text}
  </li>
);
```

> there are no id value
```js
contentComments.map((list, index) => 
  <li key={index}>
    {list.name}
    {list.text}
  </li>
)
```

```js
<div className="main-content">
  {mainContentObj.map((list) => (
    <PostContent mainContentObj={list} key={list.id} />
  ))}
</div>
```

```js

interface Props {
  name: string;
  contact: string;
  rank: string;
  certificate: string;
}

function SubComponent({ name, contact, rank, certificat}: Props) {
  return (
    <>
      <TableRow>
        <TableCell padding="checkbox">
          <Checkbox></Checkbox>
        </TableCell>
        <TableCell align="center">{name}</TableCell>
        <TableCell align="center">{contact}</TableCell>
        <TableCell align="center">{rank}</TableCell>
        <TableCell align="center">{certificate}</TableCell>
      </TableRow>
    </>
  )
}
```

```js
  {memberList.map((mem, index) => (
    <SubComponent key={index} name={mem.name} contact={mem.contact} rank={mem.rank} certificate={mem.certificate} />
  ))}
```
<br>

----

<br>

```js
const numbers = [ 1, 2, 3, 4, 5];
const listItems = numbers.map((number) => 
  <li key={number.toString()}>
    {number}
  </li>
);
```
```js
const todoItems = todos.map((todo) => 
  <li key={todo.id}>
    {todo.text}
  </li>
);
```

```js
const todoItems = todos.map((todo, index) =>
  <li key={index}>
    {todo.text}
  </li>
);
```

```ts
function ListItem(props) {
  // Correct! There is no need to specify the key here:
  return <li>{props.value}</li>;
}

function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    // Correct! Key should be specified inside the array.
    <ListItem key={number.toString()} value={number} />
  );
  return (
    <ul>
      {listItems}
    </ul>
  );
}
```

```js
import React from 'react';
import ReactDOM from 'react-dom';

// Component to be extracted
function MenuItems(props)
{
  const item = props.item;

  return(
    <li key = {item.toString()}>
      {item}
    </li>
  );
}
			
// Component that will return an
// unordered list
function Navmenu(props)
{
  const list = props.menuitems;
  const updatedList = list.map((listItems)=>{

    return (
      <MenuItems item={ listItems } />
    );
  });
			
  return(
    <ul>{updatedList}</ul>);
}

const menuItems = [1, 2, 3, 4, 5];

ReactDOM.render( <Navmenu menuitems = {menuItems} />,document.getElementById('root'));
		

```


```js
export default function App() {
  const employee = {
    id: 1,
    name: 'Alice',
    salary: 100,
  };

  return (
    <div>
      {/* 👇️ iterate object KEYS */}
      {Object.keys(employee).map((key, index) => {
        return (
          <div key={index}>
            <h2>
              {key}: {employee[key]}
            </h2>

            <hr />
          </div>
        );
      })}

      <br />
      <br />
      <br />

      {/* 👇️ iterate object VALUES */}
      {Object.values(employee).map((value, index) => {
        return (
          <div key={index}>
            <h2>{value}</h2>

            <hr />
          </div>
        );
      })}
    </div>
  );
}
```

```js
const employee = {
  id: 1,
  name: 'Alice',
  salary: 100,
};

// 👇️ ['id', 'name', 'salary']
console.log(Object.keys(employee));

// 👇️ [1, 'Alice', 100]
console.log(Object.values(employee));
```

```js
export default function App() {
  const employee = {
    id: 1,
    name: 'Alice',
    salary: 100,
  };

  return (
    <div>
      {/* 👇️ iterate object KEYS */}
      {Object.keys(employee).map(key => {
        return (
          <div key={key}>
            <h2>
              {key}: {employee[key]}
            </h2>

            <hr />
          </div>
        );
      })}
    </div>
  );
}
```


```js
export default function App() {
  const employee = {
    id: 1,
    name: 'Alice',
    salary: 100,
  };

  return (
    <div>
      {/* 👇️ iterate object VALUES */}
      {Object.values(employee).map((value, index) => {
        return (
          <div key={index}>
            <h2>{value}</h2>

            <hr />
          </div>
        );
      })}
    </div>
  );
}
```