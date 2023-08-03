## application/json 

<br>

> example #1

```js
let data = {
    id: id,
    pw: password
}

axios.post(url, JSON.stringify(data), {
    headers: {
        "Content-Type": `application/json`,
    },
})
.then((res) => {
    console.log(res);
})
```
<br>

> example #2
```js
axios.post('/api/data', {
  data: {
    name: 'John',
    age: 30
  }
}, {
  headers: {
    'Content-Type': 'application/json'
  }
})
.then(response => {
  console.log(response);
})
.catch(error => {
  console.log(error);
});
```

## application/x-www-form-urlencoded

<br>

> example #1
```js
import qs from 'qs';

const data = { 'hello': 123 };

axios.post (
    '/foo',
    qs.stringify(data),
    headers: {
        "Content-Type": `application/x-www-form-urlencoded`,
    },
)
.then ((res) => {
    console.log(res);
});
```

<br>

> example #2

```js
const qs = import('qs');

axios.post('/api/data', 
  qs.stringify({
    name: 'John',
    age: 30
  }),
  {
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  }
)
.then(response => {
  console.log(response);
})
.catch(error => {
  console.log(error);
});
```


## multipart/form-data

<br>

> example #1
```js
var photoFile = document.getElementById("photo");
const formData = newFormData();
formData.append("photo", photoFile.files[0]);
formData.append("coment", commentValue);
axios.post('https://domain/form-post-url', formData, {
    headers: {
        'Content-Type': 'multipart/form-data'
    }
})
```

<br>

> example #2
```js
const formData = new FormData();
formData.append('file', file); // file은 업로드할 파일 객체입니다.

axios.post('/api/upload', formData, {
  headers: {
    'Content-Type': 'multipart/form-data'
  }
})
.then(response => {
  console.log(response);
})
.catch(error => {
  console.log(error);
});

```