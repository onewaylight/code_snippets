# .map

https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/map


```ts
const array = [ 2, 4, 5, 7, 8];

const mapres = array.map(x => x * 2);

console.log(mapres);

```

```ts
[ '1', '2', '3' ].map(parseInt);
```

```js

const arrA = [ 'hello', 'my', 'name', 'is', 'youju' ]
const arrB = arrA.map ( str => {
  return str.length;
});

console.log(arrB);
```

```js
const arrA = [ 'hello', 'my', 'name', 'is', 'youju' ];
const arrB = [];
arrA.forEach(str => { arrB.push(str.length);
});

console.log(arrB);
```

```js

function list() {
  let listJson = [{name : "멍멍이", salary : 6000000},
                  {name : "야옹이", salary : 2000000},
                  {name : "짹짹이", salary : 900000},
                  {name : "개굴이", salary : 8000000},
                  {name : "왈왈이", salary : 5000000},
                  {name : "꿀꿀이", salary : 3000000}];
  
  let newJson = listJson.map((element, index) => {
    console.log(element);
    let returnObj = {}
    returnObj[element.name] = element.salary;
    return returnObj;
  });
  console.log("newObj");
  console.log(newJson);
};
list();

//결과값
newObj
[{name: "멍멍이", salary: 6000000},
 {name: "야옹이", salary: 2000000},
 {name: "짹짹이", salary: 900000},
 {name: "개굴이", salary: 8000000},
 {name: "왈왈이", salary: 5000000},
 {name: "꿀꿀이", salary: 3000000}];

```

# .filter

https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/filter

```js

const words = ['banana', 'apple', 'watermelon', 'pear', 'cherry', 'strawberry'];
const result = words.filter(word => word.length > 6);
console.log(result);
```

```js
//filter함수로 차집합 구하기
const arrA = ['3', '4', '3', '5', '7', '9', '4'];
const arrB = ['4', '2', '5', '7', '1', '2'];

const difference = arrA.filter( x => !arrB.includes(x));

console.log(difference);

//검색 조건에 따른 배열 필터링(쿼리)
const fruits = ['banana', 'apple', 'orange', 'pear', 'grapes', 'strawberry'];

const filterItems = (query) => {
  return fruits.filter((el) => 
     el.toLowerCase().indexOf(query.toLowerCase()) > -1
  	);
  }


console.log(filterItems('ap')); // ['apple', 'grapes']
console.log(filterItems('an')); // ['banana', 'mango', 'orange']
```

# .find

https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/find


```js

const arrA = [ 5, 12, 4, 6, 3, 33];

const found = arrA.find(element => element > 10);

console.log(found);

```

```js
const inventory = [
  { name: 'apples',   quantity: 2 },
  { name: 'bananas',  quantity: 4 },
  { name: 'cherries', quantity: 9 }
];

const result = inventory.find(fruit => fruit.name === 'cherries');

console.log(result);
```

# .reduce

https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce

```js

const arrA = [ 1, 2, 3, 4, 5 ];
const reducer = (accumulator, currentValue) => accumulator + currentValue;

console.log(arrA.reduce(reducer));
```

```js

let arr = [ 9, 2, 8, 5, 7 ];
let sum = arr.reduce((pre, value) => {
  return pre + value;
});
console.log(sum);


let arr = [ 10, 100, 3, 4, 50, 7 ];
let arrB = arr.reduce((pre, value) => {
  if ( value % 5 === 0) {
    pre.push(value);
  }
  return pre;
}, []);
console.log(arrB);
```