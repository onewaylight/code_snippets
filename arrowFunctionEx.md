```js
function Moive() {
  let self = this;
  self.title = 'hobbit';

  setInterval(function() {
    console.log(self.title);
  }, 1000);
}
```

```js
function Movie() {
  this.title = 'hobbit';

  setInterval(() => {
    console.log(this.title);
  }, 1000);
}
```
<br>

>
```js
array.forEach(() => console.log('hi'));
```

```js 
array.forEach(title => console.log(title));
```

```js
array.forEach((title,idx,arr) => console.log(idx + '-' + title));
```

```js
array.forEach((title, idx, arr) => {
  console.log(idx + '-' + title);
  console.log(arr);
});
```