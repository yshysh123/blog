# 手写代码
1. 扁平化嵌套数组/flat实现

```javascript
let array = [1, [1, 2, 3], [1, [2, {}]] ]
handle(array) // [1, 1, 2, 3, 1, 2, {}]
```

```javascript
//方法1
const handle = array => JSON.parse(`[${JSON.stringify(arr).replace(/\[|]/g,'')}]`)
handle(array)   // [ 1, 1, 2, 3, 1, 2, {} ]

//方法2
const handle = array => array.reduce((accumulator, currentValue) => accumulator.concat(Array.isArray(currentValue) ? handle(currentValue): currentValue), [])
handle(array)   // [ 1, 1, 2, 3, 1, 2, {} ]

//方法3
const handle = array => {
    while(array.some(item => Array.isArray(item))) {
        array = [].concat(...array)
    }
    return array
}
handle(array)   // [ 1, 1, 2, 3, 1, 2, {} ]
```

2. 数组去重
```javascript
let array = [1, 2, 1, '3', '3', 0 , 1]
handle(array)   // [1, 2, '3', 0]
```

```javascript
//方法1
const handle = array => [...new Set(array)]
handle(array)   // [ 1, 2, '3', 0 ]

//方法2
const handle = array => array.reduce((accumulator, currentValue) => {
    !accumulator.includes(currentValue) && accumulator.push(currentValue)
    return accumulator
}, [])
handle(array)   // [ 1, 2, '3', 0 ]

//方法3
const handle = array => {
    let map = new Map()
    return array.filter(item => map.has(item) ? false : map.set(item))
}
handle(array)   // [ 1, 2, '3', 0 ]
```
