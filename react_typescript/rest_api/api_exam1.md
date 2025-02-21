
```ts
// Install axios by running: npm install axios
import React, { useState, useEffect } from 'react';
import axios from 'axios';

// Define the base API URL
const API_BASE_URL = 'http://www.example.com/api';

// UserManagement component
const UserManagement: React.FC = () => {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    // Fetch users from the API
    axios.get(`${API_BASE_URL}/users`)
        .then(response => {
            setUsers(response.data);
        })
        .catch(error => {
            console.error('Error fetching users:', error);
        });
  }, []);

  return (
    <div>
      <h2>User Management</h2>
      <ul>
        {users.map(user => (
          <li key={user.id}>{user.username}</li>
        ))}
      </ul>
    </div>
  );
};

// Main App component
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
```