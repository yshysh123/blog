# Partial

假设我们有一个定义 user 的接口，如下
```javascript
interface IUser {
  name: string
  age: number
  department: string
}
```
经过 Partial 类型转化后得到

```javascript
type optional = Partial<IUser>
// optional的结果如下
type optional = {
    name?: string | undefined;
    age?: number | undefined;
    department?: string | undefined;
}
```
