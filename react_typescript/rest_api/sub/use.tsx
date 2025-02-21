// App.tsx
import React, { useState, useEffect } from 'react';
import { fetchUsers } from './api';

const UserManagement: React.FC = () => {
    const [users, setUsers] = useState([]);

    useEffect(() => {
    
        // Fetch users from the API
        fetchUsers()
            .then((response) => {
                setUsers(response.data);
            })
            .catch((error) => {
                console.error("Error fetching users:", error);
            });
    }, []);

    return (
        <div>
            <h2>User Management</h2>
            <ul>
            {
                users.map((user) => (
                    <li key={user.id}>{user.username}</li>
                ))
            }
            </ul>
        </div>
    );
};

const App: React.FC = () => {
    return (
        <div>
            <h1>React TypeScript App</h1>
            <UserManagement />
            {/* Add other components that use the API here */}
        </div>
    );
};

export default App;
