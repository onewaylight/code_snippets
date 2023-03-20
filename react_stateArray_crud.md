```ts
export interface TodoInterface {
    id: string;
    name: string;
    isCompleted: boolean;
}
```

```ts
const [todos, setTodos] = useState<TodoInterface[]>([]);
```

## 🔭 Create
```ts
    function handleTodoCreate(todo: TodoInterface) {
        ...
    }
```

> Type #1
```ts
        const newTodosState: TodoInterface[] = [...todos];
        newTodosState.push(todo);
        setTodos(newTodosState);
```

> Type #2
```ts
        setTodos( todos => [ ...todos, todo]);
```

## 🧄 Update
```js
    function handleTodoUpdate(event: React.ChangeEvent<HTMLInputElement>, id: string) {
        const newTodosState: TodoInterface [] = [...todos];
        newTodosState.find((todo: TodoInterface) => todo.id === id)!.name = event.target.value;

        setTodos(newTodosState);
    }
```

## 🍎 Remove
> Type #1
```js
    function handleTodoRemove(id: string) {
        const newTodosState: TodoInterface[] = todos.filter((todo: TodoInterface) => todo.id !== id);

        setTodos(newTodosState);
    }
```

> Type #2

```js
    function handleTodoRemove(id: string) {
        setTodos(todos.filter((todo: TodoInterface) => todo.id !== id));
    }
```

## 🍉 Appendix - Change status in interface
```js
    function handleTodoComplete(id: string) {
        const newTodoComplete: TodoInterface[] = [...todos];

        newTodoState.find((todo: TodoInterface) => todo.id === id)!.isCompleted =
                !newTodoState.find((todo: TodoInterface) => todo.id === id)!.isCompleted;
        setTodos(newTodoState);
    }
```

----

## Use Case #1

```js
    const handleWorkerCheck = ( event: ChangeEvent<HTMLInputElement>, index: string): void => {
        
        const newCkStatus: ICheckedStatus[] = [...workerListCheckStatus];
        
        newCkStatus.find ( el => el.fid === Number(index))!.status = event.target.checked;
        setWorkerListCheckStatus(newCkStatus);
    }
```

> Is this working? need to check. Maybe it seems be work.
```js
    setData ( data.map(item => item.id === index ? { ...item, someProp : "changed" } : item ));
```

```ts
const handleDeleteWokerList = (): void => {

    let memberList = [];

    workerListCheckStatus.forEach(function(el) {
        let ret = workMemberList.find ( mb => Number(mb.wp_member_id) === el.fid && el.status === false);
        
        if ( ret)
            memberList.push(ret);
    });

    console.log(memberList);
    setWorkMemberList(memberList);
}
```

## Use Case #2

```js
interface FactorStructure {
    id: number,
    factor: string,
    name: string,
    code: string
}

const [factorLists, setFactorLists] = useState<FactorStructure[]>([]);
const [factorList, setFactorList] = useState<FactorStructure>(null);

setFactorList({ ...factorList, name: 'David' });
setFactorList({ ...factorList, code: 'CD1234' });

setFactorLists(factorLists => [...factorLists, factorList]);

handleChange = ( event: React.ChangeEvent<HTMLInputElement>) => {
    setFactorList({
        ...factorList,
        [event.target.name]: event.target.value
    });
}
```