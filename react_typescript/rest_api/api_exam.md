>userService.ts
```ts
import axios from 'axios'

export interface User {
    id: number
    name: string
    email: string
}

export async function getUsers(): Promise<User[]> {
    const response = await axios.get<User[]>('https://api.example.com/users')

    return response.data
}
```

```ts
import React, { useState, useEffect } from 'react'
import { User, getUsers } from './userService'

function UsersComponent()
{
    const [users, setUsers] = useState<User[]>([])
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState(false)

    useEffect(() => {
        setLoading(true)
        getUsers()
            .then( users => {
                setUsers(users)
                setLoading(false)
            })
            .cache(() => {
                setError(true)
                setLoading(false)
            })
    }, []);

    if (loading) return <div>Loading...</div>
    if (error) return <div>Error!</div>

    return (
        <div>
        {
            users.map(user => (
                <div key={user.id}>
                    <div>{user.name}</div>
                    <div>{user.email}</div>
                </div>
            ))
        }
        </div>
    )
}
```

```ts
import React from 'react'
import ReactDOM from 'react-dom'
import { AxiosProvider } from './AxiosProvider'
import UsersComponent from './UsersComponent'
```

```ts
<AxiosProvider>
    <UsersComponent />
</AxiosProvider>
document.getElementById('root')
```

>  AxiosProvider

```ts
import React, { ReactNode } from 'react'
import axios, { AxiosInstance } from 'axuis'

const axiosInstance = axios.create()
export const AxiosContext = React.createContext
```