> src/store/actionTypes.js

```js
export const INCREMENT = "INCREMENT";
export const INCREMENT = "DECREMENT";
export const RESET = "RESET";
```

> src/store/actionCreators.js
```js
import { INCREMENT, DECREMENT, RESET } from 'actionTypes';

export const increment = () => ({ type: INCREMENT });
export const decrement = () => ({ type: DECREMENT });
export const reset = () => ({ type: RESET });
```

> src/store/reducer.js
```js
import { INCREMENT, DECREMENT, RESET } from 'actionTypes';

export const reducer = ( state, action ) => {
    const { type, payload } = action;
    switch ( type) {
        case INCREMENT:
            return { ...state, number: state.number + 1 };
        case DECREMENT:
            return { ...state, number: state.number - 1 };
        case RESET:
            return { ...state, number: 0 };
        default:
            return state;
    }
}
```
> src/StoreProvider.js
```js
import { useReducer, createContext } from 'react';
import { reducer } from './reducer';

const initialState = {
    number: 0,
};

const store = createContext(initialState);
const { Provider } = store;

const StoreProvider = ({ children }) => {
    const [state, dispatch] = useReducer(reducer, initialState);
    return <Provider value={[state, dispatch]}>{children}</Provider>;
};

export { store, StoreProvider };
```

> src/index.js
```js
import React from 'react';
import ReactDOM from 'react-dom';
import 'index.css';
import App from 'App';
import { StoreProvider } from 'store';

ReactDOM.render(
    <React.StrictMode>
        <StoreProvider>
            <App />
        </StoreProvider>
    </React.StrictMode>

    document.getElementById('root');
);
```

> src/App.js
```js
    import 'App.css';
    import { useContext } from 'react';
    import { store } from 'store';
    import { decrement, increment, reset } from './store/actionCreator';

    function App() {
        const [state, dispatch] = useContext(store);

        const handleIncrement = e => {
            e.preventDefault();
            dispatch(increment());
        };

        const handleDecrement = e => {
            e.preventDefault();
            dispatch(decrement());
        };

        const handleReset = e => {
            e.preventDefault();
            dispatch(reset());
        };

        return (
            <div className="App">
                <input type="number" value={state.number} readOnly />
                <input type="button" onClick={handleIncrement} value="plus">
                <input type="button" onClick={handleDecrement} value="minus">
                <input type="button" onClick={handleReset} value="reset">
            </div>
        )
    }
```