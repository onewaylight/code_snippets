<b><h2 style="color:cyan;">.map </h2></b>

```js
var officers = [
  { id: 20, name: 'Captain Piett' },
  { id: 24, name: 'General Veers' },
  { id: 56, name: 'Admiral Ozzel' },
  { id: 58, name: 'Commander jerjerrod' }
];
```

```js
var officersIds = [];
officers.forEach ( function(officer) {
  officersIds.push(officer.id);
});
```

```js
var officersIds = officers.map(function(officer) {
  return officer.id
});
```

```js
const officerIds = offices.map( el => el.id);
```

<b><h2 style="color:cyan">.reduce</h2></b>


```js
var pilots = [
  {
    id: 10,
    name: "Poe Dameron",
    years: 14,
  },
  {
    id: 2,
    name: "Temmin 'Snap' Wexley",
    years: 30,
  },
  {
    id: 41,
    name: "Tallissan Lintra",
    years: 16,
  },
  {
    id: 99,
    name: "Ello Asty",
    years: 22,
  }
];
```

```js
  var totalYears = pilots.reduce(function(acc, pilot) {
    return acc + pilot.years;
  }, 0);
```

```js
  const totalYears = pilots.reduce(( acc, pilot) => acc + pilot.years, 0);
```

<br>

> find oldest pilot
```js
  var mostExpPilot = pilots.reduce(function(oldest, pilot) {
    return ( oldest.year || 0)  > pilot.year ? oldest : pilot;
  }, {});
```

<h2 style="color:cyan;"><b> .filter </h2>

```js
var pilots = [
  {
    id: 2,
    name: "Wedge Antilles",
    faction: "Rebels",
  },
  {
    id: 8,
    name: "Ciena Ree",
    faction: "Empire",
  },
  {
    id: 40,
    name: "Iden Versio",
    faction: "Empire",
  },
  {
    id: 66,
    name: "Thane Kyrell",
    faction: "Rebels",
  }
];
```

```js
var rebels = pilots.filter(function (pilot) {
  return pilot.faction === "Rebels";
});
var empire = pilots.filter(function (pilot) {
  return pilot.faction === "Empire";
});
```


```js
const rebels = pilots.filter(pilot => pilot.faction === "Rebels");
const empire = pilots.filter(pilot => pilot.faction === "Empire");
```
<br>

## merge together all ( .map(), .reduce, .filter)

```js
var personnel = [
  {
    id: 5,
    name: "Luke Skywalker",
    pilotingScore: 98,
    shootingScore: 56,
    isForceUser: true,
  },
  {
    id: 82,
    name: "Sabine Wren",
    pilotingScore: 73,
    shootingScore: 99,
    isForceUser: false,
  },
  {
    id: 22,
    name: "Zeb Orellios",
    pilotingScore: 20,
    shootingScore: 59,
    isForceUser: false,
  },
  {
    id: 15,
    name: "Ezra Bridger",
    pilotingScore: 43,
    shootingScore: 67,
    isForceUser: true,
  },
  {
    id: 11,
    name: "Caleb Dume",
    pilotingScore: 71,
    shootingScore: 85,
    isForceUser: true,
  },
];
```

```js
var jediPersonnel = personnel.filter(function (person) {
  return person.isForceUser;
});
// 결과: [{...}, {...}, {...}] (Luke, Ezra and Caleb)
```

```js
var jediScores = jediPersonnel.map(function (jedi) {
  return jedi.pilotingScore + jedi.shootingScore;
});
// Result: [154, 110, 156]
```

```js
var totalJediScore = jediScores.reduce(function (acc, score) {
  return acc + score;
}, 0);
// Result: 420
```

```js
var totalJediScore = personnel
  .filter(function (person) {
    return person.isForceUser;
  })
  .map(function (jedi) {
    return jedi.pilotingScore + jedi.shootingScore;
  })
  .reduce(function (acc, score) {
    return acc + score;
  }, 0);
```

```js
const totalJediScore = personnel
  .filter(person => person.isForceUser)
  .map(jedi => jedi.pilotingScore + jedi.shootingScore)
  .reduce((acc, score) => acc + score, 0);
```