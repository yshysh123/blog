# 本项目内面试题均来自网络如果雷同 纯属巧合

## (a === 1 && a === 2 && a ===3)的值能是 true 吗？

```bash
var value = 0; //window.value
Object.defineProperty(window, 'a', {
    get: function() {
        return this.value += 1;
    }
});

console.log(a===1 && a===2 && a===3) // true
```

## 深拷贝方法

```bash
JSON.parse(JSON.stringify(copyObj))
```

```bash
function deepCopy( source ) {
    let target = Array.isArray( source ) ? [] : {}
    for ( var k in source ) {
        if ( typeof source[ k ] === 'object' ) {
            target[ k ] = deepCopy( source[ k ] )
        } else {
            target[ k ] = source[ k ]
        }
    }
    return target
}
```
