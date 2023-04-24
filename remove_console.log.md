## .balelrc

```json
{
    "env": {
        "production": {
            "plgins": ["transform-remove-console"]
        }
    }
}
```

### Add App.js 
```js
    if ( process.env.NODE_DEV === "production") {
        console.log = function no_console() {}
        console.warn = function no_console() {}
    }
```

```js
    console.warn = function () {};
```