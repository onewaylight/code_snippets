```ts

interface FactorStructure {
    id: number,
    factor: string,
    name: string,
    code: string
}

const [factorLists, setFactorLists] = useState<FactorStructure[]>([]);
const [factorList, setFactorList] = useState<FactorStructure>(null);

//...

setFactorList({ ...factorList, name: 'hi' });
setFactorList({ ...factorList, code: 'C123' });

setFactorLists(factorLists => [...factorLists, factorList]);

//...

handleChange = ( event: React.ChangeEvent<HTMLInputElement>) => {

    setFactorList({
        ...factorList,
        [event.target.name]: event.target.value 
    });
}
```


```js
function App() {
    
    const [user, setUser] = useState({ name: "", age: 0, email: "" });

    return (
        <div className="App">
            <div className="form">
                <input 
                    onChange={(e) => {
                        setUser({ ...user, name: e.target.value });
                    }}
                />
                <input 
                    onChange{(e) +> {
                        setUser({ ...user, age: e.target.value });
                    }}
                />
                <input 
                    onChange{(e) +> {
                        setUser({ ...user, email: e.target.value });
                    }}
                />
            </div>
        </div>
    )
}
```

```js
function App() {
    
    const [name, setName] = useState('');
    const [age, setAge] = useState(0);
    const [email, setEmail] = useState('');

    return (
        <div className="App">
            <div className="form">
                <input 
                    onChange={(e) => {
                        setName(e.target.value);
                    }}
                />
                <input 
                    onChange{(e) => {
                        setAge(e.target.value);
                    }}
                />
                <input 
                    onChange{(e) +> {
                        setEmail(e.target.value);
                    }}
                />
            </div>
        </div>
    )
}
```