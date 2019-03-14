# Hook 是一项新功能提案，可让您在不编写类的情况下使用状态和其他 React 功能。

## useState 在函数式组件内维护 state

```javascript
import { useState } from "react";

function Example() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>Click me</button>
    </div>
  );
}
```

## useEffect 函数式组件内有副作用的调用与 componentDidMount、componentDidUpdate 类似但又有所区别

```javascript
useEffect(() => {
  const subscription = props.source.subscribe();
  return () => {
    subscription.unsubscribe();
  };
}, [props.source]);
```

## useContext 监听 provider 更新变化

```javascript
import React, { createContext, useState } from "react";

// 1. 使用 createContext 创建上下文
export const UserContext = new createContext();

// 2. 创建 Provider
export const UserProvider = props => {
  let [username, handleChangeUsername] = useState("");
  return (
    <UserContext.Provider value={{ username, handleChangeUsername }}>
      {props.children}
    </UserContext.Provider>
  );
};

// 3. 创建 Consumer
export const UserConsumer = UserContext.Consumer;
```
