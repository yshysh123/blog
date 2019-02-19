# 设计模式

## 什么是设计模式？

设计模式（Design pattern）是一套被反复使用、多数人知晓的、经过分类编目的、代码设计经验的总结。

使用设计模式是为了可重用代码、让代码更容易被他人理解、保证代码可靠性。 毫无疑问，设计模式于己于他人于系统都是多赢的；设计模式使代码编制真正工程化；设计模式是软件工程的基石脉络，如同大厦的结构一样。

## 单例模式

登录框、购物车

- 系统中被唯一使用
- 一个类中只有一个实例

```javascript
/**
 * 在执行当前 Single 只获得唯一一个对象
 */
var Single = (function(){
    var instance;
    function init() {
        //define private methods and properties
        //do something
        return {
            //define public methods and properties
        };
    }
    return {
        // 获取实例
        getInstance:function(){
            if(!instance){
                instance = init();
            }
            return instance;
        }
    }
})();
var obj1 = Single.getInstance();
var obj2 = Single.getInstance();

console.log(obj1 === obj2);
```

## 构造函数模式

```javascript
/**
 * 构造一个动物的函数 
 */
function Animal(name, color){
    this.name = name;
    this.color = color;
    this.getName = function(){
        return this.name;
    }
}
// 实例一个对象
var cat = new Animal('猫', '白色');
console.log( cat.getName() );
```

## 工厂模式

你去购买汉堡，直接点餐、取餐，不会自己亲手做，商店要“封装”做汉堡的工作，做好直接给买者

- 将new操作单独封装
- 遇到new时，就要考虑是否该使用工厂模式了

```javascript
/**
 * 工厂模式
 */
function Animal(opts){
    var obj = new Object();
    obj.name = opts.name;
    obj.color = opts.color;
    obj.getInfo = function(){
        return '名称：'+obj.name +'， 颜色：'+ obj.color;
    }
    return obj;
}
var cat = Animal({name: '波斯猫', color: '白色'});
cat.getInfo();
```

应用场景

```javascript
//仿jQuery代码
class jQuery {
    constructor(selector) {
        let slice = Array.prototype.slice;
        let dom = slice.call(document.querySelectorAll(selector))
        let len = dom ? dom.length : 0
        for (let i = 0; i < len; i++) {
            this[i] = dom[i]
        }
        this.length = len
        this.selector = selector || ''
    }
    append() {
        console.log('append');
    }
    addClass() {
        console.log('addClass')
    }

}

window.$ = function(selector) {
    return new jQuery(selector);
}

var $p = $('p')
console.log($p)
console.log($p.addClass)
```

## 模块模式

```javascript
/**
 * 模块模式 = 封装大部分代码，只暴露必需接口
 */
var Car = (function(){
    var name = '法拉利';
    function sayName(){
        console.log( name );
    }
    function getColor(name){
        console.log( name );
    }
    return {
        name: sayName,
        color: getColor
    }
})();
Car.name();
Car.color('红色');
```

## 适配器模式

- 旧接口格式和使用者不兼容
- 中间加一个适配转换接口

```javascript
class Adaptee {
    specificRequest() {
        return '德国标准插头'
    }
}


class Target {
    constructor() {
        this.Adaptee = new Adaptee()
    }
    request() {
        let info = this.Adaptee.specificRequest()
        return `${info} - 转换器 - 中国标准插头`
    }
}


let target = new Target()
let res = target.request()
console.log(res)
```

使用场景：

- 封装旧接口
- vue computed

## 装饰器模式

- 为对象添加新功能
- 不改变其原有的结构和功能

```javascript
class Circle {
    draw() {
        console.log('画一个圆形')
    }
}

class Decorator {
    constructor(circle) {
        this.circle = circle
    }
    draw() {
        this.circle.draw()
        this.setRedBorder(circle)
    }
    setRedBorder(circle) {
        console.log('设置红色边框')
    }
}

let circle = new Circle();
circle.draw()

let decorator = new Decorator(circle)
decorator.draw()
```

使用场景

- ES7装饰器
- core-decorators

## 代理模式

- 使用者无权访问目标对象
- 中间加代理，通过代理做授权和控制

```javascript
class RealImg {
    constructor(fileName) {
        this.fileName = fileName;
        this.loadFromDisk() //初始化即从硬盘中加载，模拟
    }
    display() {
        console.log('display...' + this.fileName)
    }
    loadFromDisk() {
        console.log('loading...' + this.fileName)
    }
}

class ProxyImg {
    constructor(fileName) {
        this.realImg = new RealImg(fileName)
    }
    display() {
        this.realImg.display()
    }
}

let proxyImg = new ProxyImg('1.png')
proxyImg.display()
```

使用场景

- 网页事件代理
- ES6 Proxy

## 外观模式

- 为子系统中的一组接口提供了一个高层接口
- 使用者使用这个高层接口

```javascript
function bindEvent(elem,type,selector,fn){
    if(fn == null){
        fn = selector
        selector = null
    }
}

//调用
bindEvent(elem,'click','#div1',fn)
bindEvent(elem,'click',fn)
```

## 观察者模式

- 发布&订阅
- 一对多(N)

```javascript
//保存状态，状态变化之后触发所有观察者
class Subject {
    constructor() {
        this.state = 0
        this.observers = []
    }
    getState() {
        return this.state
    }
    setState(state) {
        this.state = state
        this.notifyAllObervers()
    }
    notifyAllObervers() {
        this.observers.forEach(observer => {
            observer.update()
        })
    }
    attach(observer) {
        this.observers.push(observer)
    }
}

//观察者
class Observer {
    constructor(name, subject) {
        this.name = name
        this.subject = subject
        this.subject.attach(this)
    }
    update() {
        console.log(`${this.name} update,state:${this.subject.getState()}`)
    }
}

let subject = new Subject();
let obs1 = new Observer('o1', subject);
let obs2 = new Observer('o2', subject);
let obs3 = new Observer('o3', subject);

subject.setState(1)
subject.setState(2)
```

应用场景

- 网页事件绑定
- Promise
- nodejs自定义事件
- vue和React组件生命周期触发
