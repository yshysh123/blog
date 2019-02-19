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

## 如何准确判断一个变量的类型

在 JavaScript 里使用 typeof 判断数据类型，只能区分基本类型，即：number、string、undefined、boolean、object。

```bash
Object.prototype.toString.call(null); // "[object Null]"
Object.prototype.toString.call(undefined); // "[object Undefined]"
Object.prototype.toString.call(“abc”);// "[object String]"
Object.prototype.toString.call(123);// "[object Number]"
Object.prototype.toString.call(true);// "[object Boolean]"
**函数类型**
Function fn(){
  console.log(“test”);
}
Object.prototype.toString.call(fn); // "[object Function]"
**日期类型**
var date = new Date();
Object.prototype.toString.call(date); // "[object Date]"
**数组类型**
var arr = [1,2,3];
Object.prototype.toString.call(arr); // "[object Array]"
**正则表达式**
var reg = /[hbc]at/gi;
Object.prototype.toString.call(reg); // "[object RegExp]"
**自定义类型**
function Person(name, age) {
    this.name = name;
    this.age = age;
}
var person = new Person("Rose", 18);
Object.prototype.toString.call(person); // "[object Object]"
**判断原生JSON**
var isNativeJSON = window.JSON && Object.prototype.toString.call(JSON);
console.log(isNativeJSON);// 输出结果为”[object JSON]”说明JSON是原生的，否则不是；
```

## 写一个原型链继承的方法

```bash
function Person(){
    this.eat = function(){
        console.log('Person eat');
    }
}
function Man(){
    this.bark = function(){
        console.log("Man bark");
    }
}
Man.prototype = new Person();

var yush = new Man();
```

## 深拷贝方法

```bash
JSON.parse(JSON.stringify(copyObj))
```

```bash
function deepClone(obj) {
  if (Object.prototype.toString.call(obj) === '[object Function]') {
    const str = obj.toString();
    /^function\s*\w*\s*\(\s*\)\s*\{(.*)/.test(str);
    const str1 = RegExp.$1.slice(0, -1);
    return new Function(str1);
  }
  if (!obj || typeof obj !== 'object') return obj;
  if (Object.prototype.toString.call(obj) === '[object Date]') return new Date(obj);
  if (Object.prototype.toString.call(obj) === '[object RegExp]') return new RegExp(obj);
  const cloneObj = Array.isArray(obj) ? [] : {};
  for (const i in obj) {
    if (obj.hasOwnProperty(i)) {
      // 保证只遍历实例属性
      cloneObj[i] = typeof obj[i] === 'object' ? deepClone(obj[i]) : obj[i];
    }
  }
  return cloneObj;
}
```

## 手写一个 Ajax

```bashvar
xhr = new XMLHttpRequest()
xhr.open("GET","/api",false)
xhr.onreadystatechange = function(){
    //这里的函数异步执行，可参考之前JS基础中的异步模块
    if(xhr.readyState == 4){
        if(xhr.status == 200){
            console.log(xhr.responseText)
        }
    }
}
xhr.send(null)
```

### readyState 状态码

- 0 - (未初始化)      还没调用 send()方法
- 1 - (载入)             已调 send() 方法，正在发送请求
- 2 - (载入完成)     send()方法执行完成，已经接收到全部相应内容
- 3 - (交互)             正在解析响应内容
- 4 - (完成)             响应内容解析完成，可以在客户端调用了

## http 状态码

- 1xx: 接受，继续处理
- 200: 成功，并返回数据
- 201: 已创建
- 202: 已接受
- 203: 成为，但未授权
- 204: 成功，无内容
- 205: 成功，重置内容
- 206: 成功，部分内容
- 301: 永久移动，重定向
- 302: 临时移动，可使用原有 URI
- 304: 资源未修改，可使用缓存
- 305: 需代理访问
- 400: 请求语法错误
- 401: 要求身份认证
- 403: 拒绝请求
- 404: 资源不存在
- 500: 服务器错误

## JS 实现懒加载

```javascript
let lazyImages = [...document.querySelectorAll(".lazy-image")];
let inAdvance = 300; // 自定义一个高度，当距离300px到达图片时加载
function lazyLoad() {
  lazyImages.forEach(image => {
    if (image.offsetTop < window.innerHeight + window.pageYOffset + inAdvance) {
      // 距离xxpx时加载图片
      image.src = image.dataset.src;
      image.onload = () => image.classList.add("loaded");
    }
  });

  // if all loaded removeEventListener
}
lazyLoad();
window.addEventListener("scroll", _.throttle(lazyLoad, 16)); // 用到了lodash的节流函数
```

## 从输入 url 到展示的过程

- DNS 解析
- TCP 三次握手
- 发送请求，分析 url，设置请求报文(头，主体)
- 服务器返回请求的文件 (html)
- 浏览器渲染
  - HTML parser --> DOM Tree 标记化算法，进行元素状态的标记 dom 树构建
  - CSS parser --> Style Tree 解析 css 代码，生成样式树
  - attachment --> Render Tree 结合 dom 树 与 style 树，生成渲染树
  - layout: 布局
  - GPU painting: 像素绘制页面

## TCP 三次握手

- 客户端发送 syn(同步序列编号) 请求，进入 syn_send 状态，等待确认
- 服务端接收并确认 syn 包后发送 syn+ack 包，进入 syn_recv 状态
- 客户端接收 syn+ack 包后，发送 ack 包，双方进入 established 状态

## TCP 四次挥手

- 客户端 -- FIN --> 服务端， FIN—WAIT
- 服务端 -- ACK --> 客户端， CLOSE-WAIT
- 服务端 -- ACK,FIN --> 客户端， LAST-ACK
- 客户端 -- ACK --> 服务端，CLOSED

## 执行上下文

概念：

- 单线程
- 同步执行
- 唯一的一个全局上下文
- 函数的执行上下文的个数没有限制
- 每次函数被调用创建新的执行上下文，包括调用自己。

## 函数柯里化

```javascript
function curry(fn, currArgs) {
  return function() {
    let args = [].slice.call(arguments);
    // 首次调用时，若未提供最后一个参数currArgs，则不用进行args的拼接
    if (currArgs !== undefined) {
      args = args.concat(currArgs);
    }
    // 递归调用
    if (args.length < fn.length) {
      return curry(fn, args);
    }
    // 递归出口
    return fn.apply(null, args);
  };
}
```

## 实现一个 new 函数

```javascript
function _new(fn, ...arg) {
  var obj = Object.create(fn.prototype);
  fn.call(obj, ...arg);
  return obj;
}
```
