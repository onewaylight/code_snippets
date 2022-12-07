# Checkbox Event handling examples

```ts
  const [items, setItems] = useState<Asset[]>([]);
  const [select, setSelect] = useState(false)

  const handleChange = (index, checked) => {
   
     if(select && !checked) setSelect(false)

     const itemRef = [...items];

     itemRef[index].selected = checked

     setItems([...itemRef]);
  } 

  const handleChangeAll = (checked) => {
     const itemRef = [...items];
    
     itemRef.forEach((_item, i) => {
        itemRef[i].selected = checked

     })

     setSelect(checked)
 
     setItems([...itemRef]);
  } 
```
   

<br><br>

## Select all checkbox
 
```ts
  <Checkbox
    checked={select}
    onChange={(_e, checked) => handleChangeAll(checked)} 
  />
```

## items iteration
  
  ```ts
  items.map((item, index) => (
     <Checkbox
       key={item.data.id} or key={index} 
       checked={item.selected}
       onChange={(_e, checked) => handleChange(index, checked)}  
      />

  ))
```

---------

<br>

```ts
import { useState, useEffect } from "react";
import ReactDOM from "react-dom";
import { Checkbox } from "@material-ui/core";

const Items = () => {
  const [categories, setCategories] = useState([]);
  const [checkedList, setCheckedList] = useState([]);
  const [itemsChecked, setItemsChecked] = useState(false);

  useEffect(() => {
    const initialCategories = [
      {
        id: 1,
        name: "category 1",
        items: [
          { name: "item 1", id: Math.floor(Math.random() * 99999) },
          { name: "item 2", id: Math.floor(Math.random() * 99999) }
        ]
      },
      {
        id: 2,
        name: "category 2",
        items: [
          { name: "item 3", id: Math.floor(Math.random() * 99999) },
          { name: "item 4", id: Math.floor(Math.random() * 99999) }
        ]
      },
      {
        id: 3,
        name: "category 3",
        items: [{ name: "item 5", id: Math.floor(Math.random() * 99999) }]
      }
    ];

    setCategories(initialCategories);
  }, []);

  const handleCheckboxClick = (e) => {
    const { value, checked } = e.target;

    if (checked) {
      setCheckedList([...checkedList, value * 1]); //*1 해줘야 number로 들어가서 type 호환이 됨.
    } else {
      setCheckedList(checkedList.filter((item) => item != value));
    }
  };

  const selectItem = (e) => {
    const { checked } = e.target;
    const collection = [];

    if (checked) {
      for (const category of categories) {
        for (const item of category.items) {
          collection.push(item.id);
        }
      }
    }

    setCheckedList(collection);
    setItemsChecked(checked);
  };

  return (
    <div>
      <header>
        <label>
          <Checkbox checked={itemsChecked} onClick={selectItem.bind(this)} />
          Select all
        </label>
      </header>
      {categories.map((category) => {
        return (
          <ItemCategory
            {...category}
            key={category.id}
            handleCheckboxClick={handleCheckboxClick}
            checkedList={checkedList}
          />
        );
      })}
    </div>
  );
};

const ItemCategory = (props) => {
  const { name, items, checkedList, handleCheckboxClick } = props;

  const getItems = items.map((item) => {
    return item;
  });

  return (
    <div>
      <div>- {name}</div>
      <ul>
        {getItems.map((item) => {
          return (
            <li key={item.id}>
              <Checkbox
                item={item}
                value={item.id}
                checked={checkedList.includes(item.id)}
                onChange={handleCheckboxClick}
              />
              {item.name}
            </li>
          );
        })}
      </ul>
    </div>
  );
};

function App() {
  return <Items />;
}

const rootElement = document.getElementById("root");
ReactDOM.render(<App />, rootElement);
```