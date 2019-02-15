# 设计模式

## 什么是设计模式？

设计模式（Design pattern）是一套被反复使用、多数人知晓的、经过分类编目的、代码设计经验的总结。

使用设计模式是为了可重用代码、让代码更容易被他人理解、保证代码可靠性。 毫无疑问，设计模式于己于他人于系统都是多赢的；设计模式使代码编制真正工程化；设计模式是软件工程的基石脉络，如同大厦的结构一样。

## 单体模式

### 概念：

单体是一个用来划分命名空间并将一批相关的属性和方法组织在一起的对象，如果他可以被实例化，那么他只能被实例化一次。

### 特点：

1. 可以来划分命名空间，从而清除全局变量所带来的危险。
2. 利用分支技术来来封装浏览器之间的差异。
3. 可以把代码组织的更为一体，便于阅读和维护。

### 代码实现：

```javascript
var Singleton = {
  attribute: true,
  method1: function() {},
  method2: function() {}
};
```

### 应用场景：

单体模式在我们平时的应用中用的比较多的，相当于把我们的代码封装在一个起来，只是暴露一个入口，从而避免全部变量的污染。

## 单例模式

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
