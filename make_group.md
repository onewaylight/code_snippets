```js
let leaders = [
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 }
];

let members = [	
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
    { name: '', ord: 0 },
]

members.map (mb => {
	mb.ord = Math.random() * 10000;
})

members.sort(function(a,b) {
	return a.ord - b.ord;
});


console.log('Members ');
members.map((mb, index) => {
  if ( (index % 2) === 0) { // Seperate 3rd members
    console.log('');
    console.log(Math.floor(index / 2)+1, mb.name);
  } else 
    console.log(Math.floor(index / 2)+1, mb.name);
})


leaders.map (mb => {
	mb.ord = Math.random() * 10000;
})

leaders.sort(function(a,b) {
	return a.ord - b.ord;
});


console.log('');
console.log('Leaders ');
leaders.map((mb, index) => {
	console.log(index+1, mb.name);
});

console.log('');
console.log('Last member assign to :', Math.floor(Math.random() * 9)+1);
```
