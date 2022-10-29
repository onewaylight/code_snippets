```ts
interface ButtonProps {
  sum: (a: number, b: number) => number;
  logMessage: (message: string) => void;

  // 👇️ turn off type checking
  doSomething: (params: any) => any;
}

function Container({sum, logMessage, doSomething}: ButtonProps) {
  console.log(sum(10, 15));

  logMessage('hello world');

  doSomething('abc');

  return <div>Hello world</div>;
}

const App = () => {
  const sum = (a: number, b: number) => {
    return a + b;
  };

  const logMessage = (message: string) => {
    console.log(message);
  };

  return (
    <div>
      <Container sum={sum} logMessage={logMessage} doSomething={logMessage} />
    </div>
  );
};

export default App;

```

```ts
type ButtonProps = {
  handleClick: (event: React.MouseEvent<HTMLDivElement, MouseEvent>) => void;
};

function Container({handleClick}: ButtonProps) {
  return <div onClick={handleClick}>Hello world</div>;
}

const App = () => {
  const handleClick = (event: React.MouseEvent<HTMLDivElement, MouseEvent>) => {
    console.log('element clicked');
  };

  return (
    <div>
      <Container handleClick={handleClick} />
    </div>
  );
};

export default App;

```

```ts
import React from "react";

type Props = {
  state: string;
  setState: (val: string) => void;
  handleOnSubmit: () => void;
  placeholder: string;
};

const Form: React.FC<Props> = ({
  state,
  setState,
  handleOnSubmit,
  placeholder,
}) => {
  return (
    // Hidden for simplicity
  );
};

export default Form;
```


```ts
function App() {
  const [status, setStatus] = React.useState(false);
  const [text, setText] = React.useState("");
  const handleClick = () => {
    this.setStatus(prev => ({ status: !prev.status }));
  };
  const handleChange = e => {
    this.setStatus({ text: e.target.value });
  };
  return (
    <>
      <button onClick={handleClick}>Open photo entry dialog</button>
      <ChildComponent
        isOpen={status}
        text={text}
        handleChange={handleChange}
        handleClick={handleClick}
      />
    </>
  );
}
const ChildComponent = ({ isOpen, text, handleChange, handleClick }) => {
  return (
    <>
      {isOpen && (
        <Model
          status={isOpen}
          handleClick={handleClick}
          text={text}
          handleChange={handleChange}
        />
      )}
    </>
  );
};
```

```ts
const Banner = props => {
  const name = props.name
  return (
    <div>
      <p>Hello {name}</p>
      <button onClick={props.clickHandler}>Click Me</button>
    </div>
  )
}
function App() {
  const showAlert = () => {
    alert("Welcome!")
  }
  return (
    <div>
      <Banner name="Ranjeet" clickHandler={showAlert} />
    </div>
  )
}
export default App
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