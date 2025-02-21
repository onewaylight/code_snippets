// api.ts
import axios from 'axios';

const API_BASE_URL = 'http://www.example.com/api';

export const fetchUsers = () => {
    return axios.get(`${API_BASE_URL}/users`);
};

// Add other API functions as needed
