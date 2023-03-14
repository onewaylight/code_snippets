<h2>React Components</h2>
<br>

```js
interface FormatDateProps {
  date: Date
}

function FormatDate({ date }: FormatDateProps): JSX.Element {
  return <div>{date.toLocaleString()}</div>
}
```

```js
<FormatDate
  date={new Date()}
/>
```

```js
<FormatDate
  date="Sep 28 2021"
/>
```

----

<br>

<h2>Typing props</h2>

```js
interface MessageProps {
  text: string;
  important: boolean;
}

function Message({ text, important }: MessageProps) {
  return (
    <div>
      { important ? 'Important message: ' : 'Regular message: '}
      {text}
    </div>
  );
}
```

```js
<Message
  text="The form has been submitted!"
  important={false}
/>
```

```js
interface MessageProps {
  children: JSX.Element | JSX.Element [];
  important: boolean;
}

function Message({ children, important }: MessageProps ) {
  return (
    <div>
      {important ? 'Important message: ' : 'Regular message: ' }
      { children }
    </div>
  );
}
```

```js
<Message important={false}>
  <span>The form has been submitted</span>
</Message>
```

```js
<Message important={false}>
  <span>The form has been submitted</span>
  <span>Your request will be processed</span>
</Message>
```

---

```js
interface Messageprops {
  children: JSX.Element | JSX.Element[];
  important?: boolean;
}

function Message({ children, important = false}: MessageProps) {
  return (
    <div>
      {important ? 'Important message: ' : 'Regular message: ' }
      {children}
    </div>
  );
}
```

```js
  <Message>
    <span>The form has been submitted!</span>
  </Message>
```

```js
  <Message important={true}>
    <span>The form has been submitted!</span>
  </Message>
```

<br>

---
<br>

<h2>Return Type</h2>
<br>

```js
type MessageReturnType = ReturnType<typeof Message>;
```

```js
function Message({
  children,
  important = false
} : MessageProps) : JSX.Element {
  return (
    <div>
      {important ? 'Important message: ' : 'Regular message: '}
      {children}
    </div>
  )
}
```

```js
interface ShowTextProps {
  show: boolean;
  text: string;
}

functon ShowText({ show, text }: ShowTextProps): JSX.Element | null {
  if (show) {
    return <div>{text}</div>
  } 

  return null;
}