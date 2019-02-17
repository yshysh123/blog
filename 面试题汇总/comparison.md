# 主要列举出一些提问区别的题目

## http 和 https 区别

HTTP 协议传输的数据都是未加密的，也就是明文的，因此使用 HTTP 协议传输隐私信息非常不安全，HTTPS 协议是由 SSL+HTTP 协议构建的可进行加密传输、身份认证的网络协议，要比 http 协议安全。

## xss 和 csrf 区别

- 跨站脚本 xss（cross site script）
  XSS 是指恶意攻击者利用网站没有对用户提交数据进行转义处理或者过滤不足的缺点，进而添加一些代码，嵌入到 web 页面中去。使别的用户访问都会执行相应的嵌入代码。源于过于信任客户端提交的数据，对提交的数据进行过滤，去掉 script 等关键字

- 跨站请求伪造 csrf（cross-site request forgery）
  CSRF 是一种夹持用户在已经登陆的 web 应用程序上执行非本意的操作的攻击方式。相比于 XSS，CSRF 是利用了系统对页面浏览器的信任，XSS 则利用了系统对用户的信任。

## 重绘和回流

- 重绘

当元素样式的改变不影响布局时，浏览器将使用重绘对元素进行更新，此时由于只需要 UI 层面的重新像素绘制，因此 损耗较少

- 回流

当元素的尺寸、结构或触发某些属性时，浏览器会重新渲染页面，称为回流。此时，浏览器需要重新经过计算，计算后还需要重新页面布局，因此是较重的操作。

如何避免回流和重绘：

- 避免使用 table 布局
- 将动画效果应用到 position 属性为 absolute 或 fixed 的元素上
- 避免频繁操作样式，可汇总后统一 一次修改
- 尽量使用 class 进行样式修改
- 减少 dom 的增删次数，可使用 字符串 或者 documentFragment 一次性插入
- 极限优化时，修改样式可将其 display: none 后修改
- 避免多次触发上面提到的那些会触发回流的方法，可以的话尽量用 变量存住

## 函数节流和函数防抖

- 函数节流

是为了限制函数一段时间内只能执行一次，在延时的时间内，方法若被触发，则直接退出方法，这是与防抖的区别，防抖是在延时内触发则重新计时，也就是每次都只执行一段时间的最后一次

```javascript
const _.throttle = (func, wait) => {
  let timer;
  return () => {
    if (timer) {
        return;
    }
    timer = setTimeout(() => {
        func();
        timer = null;
    }, wait);
  };
};
```

- 函数防抖

函数防抖在执行目标方法时，会等待一段时间。当又执行相同方法时，若前一个定时任务未执行完，则 clear 掉定时任务，重新定时。

```javascript
const _.debounce = (func, wait) => {
  let timer;
  return () => {
    clearTimeout(timer);
    timer = setTimeout(func, wait);
  };
};
```

## offsetWidth offsetHeight offsetLeft offsetTop clientWidth clientHeight clientLeft clientTop scrollWidth scrollHeight scrollLeft scrollTop

### offset

obj.offsetTop 指 obj 距离上方或上层控件的位置，整型，单位像素。

obj.offsetLeft 指 obj 距离左方或上层控件的位置，整型，单位像素。

obj.offsetWidth 指 obj 控件自身的宽度，整型，单位像素。

obj.offsetHeight 指 obj 控件自身的高度，整型，单位像素。

#### offsetWidth & offsetHeight

任何 HTML 元素的只读属性 offsetWidth 和 offsetHeight 已 CSS 像素返回它的屏幕尺寸，返回的尺寸包干元素的边框和内边距（width/height + border + padding），和滚动条。

#### offsetLeft & offsetTop

所有 HTML 元素拥有 offsetLeft 和 offsetTop 属性来返回元素的 X 和 Y 坐标

1. 相对于已定位元素的后代元素和一些其他元素（表格单元），这些属性返回的坐标是相对于祖先元素
2. 一般元素，则是相对于文档，返回的是文档坐标

### client

#### clientWidth & clientHeight

clientWidth 和 clientHeight 类似于 offsetWidth 和 offsetHeight，不同的是不包含边框大小（width/height + padding）。同时在有滚动条的情况下，clientWidth 和 clientHeight 在其返回值中也不包含滚动条。

#### clientLeft & clientTop

返回元素的内边距的外边缘和他的边框的外边缘的水平距离和垂直距离，通常这些值就等于左边和上边的边框宽度。

### scroll

#### scrollWidth & scrollHeight

这两个属性是元素的内容区域加上内边距，在加上任何溢出内容的尺寸.

因此，如果没有溢出时，这些属性与 clientWidth 和 clientHeight 是相等的。

#### scrollLeft & scrollTop

scrollLeft :

对象的最左边到对象在当前窗口显示的范围内的左边的距离．

即是在出现了横向滚动条的情况下，滚动条拉动的距离．

scrollTop

对象的最顶部到对象在当前窗口显示的范围内的顶边的距离．

即是在出现了纵向滚动条的情况下，滚动条拉动的距离．

scrollLeft 和 scrollTop 都是可写的属性，通过设置它们来让元素中的内容滚动。

## link 与 @import 的区别

- link 功能较多，可以定义 RSS，定义 Rel 等作用，而@import 只能用于加载 css
- 当解析到 link 时，页面会同步加载所引的 css，而@import 所引用的 css 会等到页面加载完才被加载
- @import 需要 IE5 以上才能使用
- link 可以使用 js 动态引入，@import 不行

## script defer 与 script async 的区别

- defer: 异步加载，元素解析完成后执行
- async: 异步加载，与元素渲染并行执行

## bind apply call 的区别

apply 和 call 基本类似，他们的区别只是传入的参数不同。

```javascript
//call的语法
call(obj, 1, 2, 3);
//apply的语法
apply(obj, [1, 2, 3]);
//bind的语法
bind(obj, 1, 2, 3);
```

区别：

- call 和 apply：call 和 aplly 传入的第一个参数都是一样的，第二个参数，call 需要把参数按顺序传递进去，而 apply 则是把参数放在数组里。
- call，apply 和 bind：call，apply 是在改变了上下文中的 this 指向后并立即执行函数。而 bind 知会改变上下文中的 this，不会立即执行函数

```javascript
Function.prototype.call = function(ctx, ...args) {
  const context = ctx || global; // 获取上下文，call的第一个参数
  const hash = new Date().getTime(); // 避免名字重复
  context[hash] = this; // 将this缓存，this就是调用call方法的函数
  const result = context[hash](...args); // 借助扩展运算符(...)运行函数
  delete context[hash];
  return result;
};
```

```javascript
Function.prototype.apply = function(ctx, arr) {
  const context = ctx || global; // 获取上下文，call的第一个参数
  const hash = new Date().getTime(); // 避免名字重复
  context[hash] = this; // 将this缓存，this就是调用call方法的函数
  const result = context[hash](...arr); // 借助扩展运算符(...)运行函数
  delete context[hash];
  return result;
};
```

```javascript
Function.prototype.bind = function(context, ...rest) {
  if (typeof this !== "function") {
    throw new TypeError("invalid invoked!");
  }
  const self = this;
  return function F(...args) {
    if (this instanceof F) {
      return new self(...rest, ...args);
    }
    return self.apply(context, rest.concat(args));
  };
};
```

## TCP 和 UDP 的区别是什么

- TCP：面向连接、传输可靠(保证数据正确性,保证数据顺序)、用于传输大量数据(流模式)、速度慢，建立连接需要开销较多(时间，系统资源)
- UDP：面向非连接、传输不可靠、用于传输少量数据(数据包模式)、速度快
