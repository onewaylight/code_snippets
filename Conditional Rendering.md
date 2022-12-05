```ts
  <nav>
    { 
      gameOver ? (
        <GameOver />
      ) : (
        <>
          <h1>PlayGame</h1>
          <button>Play Game</button>
        </>
      )
    }
  </nav>
```
```js
  return (
    <div>
      { 
        isRendered ? (
          <UpdateButton onClick={handleUpdateClick} />
        ) : (
          <EditButton onClick={handleEditClick} />
        )
      }
    </div>
  );
```

```js
  if ( mode === 'view' ) {
    return (
      <div>
        <p>Title: {this.state.text}</p>
        <button onClick={handleEdit}>
          Edit
        </button>
      </div>
    );
  } else {
    return (
      <div>
        <p>Title: {this.state.text}</p>
        <input
          onChange={handleChange}>
          value={this.state.inputText}
        />
      </div>
    );
  }

```

```js
  render () {
    const view = this.state.mode === 'view';
    
    return (
      <div>
        <p>Text: {this.state.text}</p>
        
        {
          !view && (
            <p>
              <input
                onChange={this.handleChange}
                value={this.state.inputText} />
            </p>
          )
        }
        
        <button
          onClick={
            view 
              ? this.handleEdit 
              : this.handleSave
          }
        >
          {view ? 'Edit' : 'Save'}
        </button>
      </div>
    );
  }
```


[React Typescript conditional rendering using objects](https://blog.logrocket.com/react-conditional-rendering-9-methods/)

```js
  render() {
    const isLoggedIn = this.state.isLoggedIn;
    return (
      <div>
        {
          isLoggedIn 
            ? <LogoutButton onClick={this.handleLogoutClick} />
            : <LoginButton onClick={this.handleLoginClick} />
        }
      </div>
    );
  }
```

