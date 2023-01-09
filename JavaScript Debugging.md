
> ## 1. Easy to log
```js
console.log('name', name);
```
==>

```js
console.log({name});
```


> ## 2. A better way to log multiple items

```js
const sunil = { name: 'Sunil', member: 'true', id: 134323 };
const ilaria = { name: 'Ilaria' member: false, id: 489348 };
```

```js
console.log(sunil);
console.log(ilaria);

console.log({sunil, ilaria});
```
<br>

> ## <b>3. use tables</b>
```js
console.table ({ foo, bar });
```

> ## <b>4. Group grouped logs</b>

```js
console.group('User Details');
console.log('name: Sunil Sandhu');
console.log('position: Software Developer');
console.groupEnd();
console.group('Account');
console.log('Member Type: Premium Member');
console.log('Member Since: 2018');
console.log('Expiry Date: 20/12/2022');
console.groupEnd();
```

```js
console.group('User Details');
console.log('name: Sunil Sandhu');
console.log('position: Software Developer');console.group('Account');
console.log('Member Type: Premium Member');
console.log('Member Since: 2018');
console.log('Expiry Date: 20/12/2022');
console.groupEnd();
console.groupEnd(); // notice that we have two groupEnd() calls at the end as we want to nest 'Account' inside of 'User Details'
```

> ## <b>5. Better warnings</b>

```js
console.warn('This function will be deprecated in the next release');
```

> ## <b> 6. Better error logging</b>

```js
console.error('Your code is broken, go back and fix it!');
```

> ## <b>7. Custom console styling</b>

```js
console.log('%c React ', 
            'color: white; background-color: #61dbfb', 
            'Have fun using React!');
```

> ## <b>8. Time the speed of functions</b>

```js
let i = 0;
console.time("While loop");

while (i < 100000) {
  i++;
}
console.timeEnd("While loop");console.time("For loop");
for (i = 0; i < 100000; i++) {
  // For Loop
}
console.timeEnd("For loop");

```

> ## <b>9. Better stack traces</b>

```js
const sunil = { name: "Sunil", member: true, id: 134323 };

function getName(person) {
  console.trace();
  return person.name;
}
