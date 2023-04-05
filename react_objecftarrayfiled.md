```javascript

const [values,setValues] = useState({
  full_name: "",
  email: "",
  password: "",
  confirmPassword: "",
  type: ""
});
```

```javascript
setValues({ ...values, email: 'new Value'});
```

```javascript
  setValues({ ...values, full_name: 'new value'});
  setValues({ ...values, password: 'new value'});
  setValues({ ...values, type: 'new value'});
```

```javascript
<TextInput
  placeholder={'Fullname'}
  value={values.full_name}
  onChangeText={(value) => 
    setValues({ ...values, })}
  onEndEditing={() => {
    if ( full_name < 2) {
      alert('Please enter valid name')
    }
  }}
/>
```