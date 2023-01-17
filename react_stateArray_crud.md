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
```ts
    function handleTodoUpdate(event: React.ChangeEvent<HTMLInputElement>, id: string) {
        const newTodosState: TodoInterface [] = [...todos];
        newTodosState.find((todo: TodoInterface) => todo.id === id)!.name = event.target.value;

        setTodos(newTodosState);
    }
```

## 🍎 Remove
> Type #1
```ts
    function handleTodoRemove(id: string) {
        const newTodosState: TodoInterface[] = todos.filter((todo: TodoInterface) => todo.id !== id);

        setTodos(newTodosState);
    }
```

> Type #2

```ts
    function handleTodoRemove(id: string) {
        setTodos(todos.filter((todo: TodoInterface) => todo.id !== id));
    }
```

## 🍉 Appendix - Change status in interface
```ts
function handleTodoComplete(id: string) {
    const newTodoComplete: TodoInterface[] = [...todos];

    newTodoState.find((todo: TodoInterface) => todo.id === id)!.isCompleted =
            !newTodoState.find((todo: TodoInterface) => todo.id === id)!.isCompleted;
    setTodos(newTodoState);
}
```