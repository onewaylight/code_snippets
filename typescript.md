
[TypeScript Tutorial W3 School](https://www.w3schools.com/typescript/typescript_object_types.php)

[TypeScript Tutorial](https://www.typescripttutorial.net/)

```ts
let variableName: type;
let variableName: type = value;
const constantName: type = value;
```

```ts
let counter: number;
let name: string = 'John';
let age: number = 25;
let active: boolean = true;
```

```ts
let arrayName: type[];
```

```ts
let name: string[]  = [ 'John', 'Jane', 'Peter', 'David', 'Mary'];
```

```ts
let person: {
  name: string;
  age: number;
};

person = {
  name: 'John',
  age: 25
};
```

```ts
let greeting: (name: string) => string;

greeting = function(name: string) {
  return `Hi $(name)`;
};

greeting = function () {
  console.log('Hello');
};
```

