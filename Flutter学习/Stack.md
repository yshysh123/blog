```dart
/**
  * FractionalOffset对齐xy 最小是0 最大是1.
  * 后组件在前组件之上展示
  */
var stack = new Stack(
  alignment: const FractionalOffset(0.5, 0.8),
  children: <Widget>[
    new CircleAvatar(
      backgroundImage:
          new NetworkImage('http://img.bqatj.com/img/161c0d7595eb4947.jpg'),
      radius: 100.0,
    ),
    new Container(
      decoration: new BoxDecoration(
        color: Colors.yellowAccent,
      ),
      padding: EdgeInsets.all(5.0),
      child: new Text('hello World'),
    ),
  ],
);
```

```dart
/**
  * FractionalOffset对齐xy 最小是0 最大是1.
  * 后组件在前组件之上展示
  * Positioned组件
  * 3个以上元素推荐使用
  * top
  * left
  * bottom
  * right
  * 类似css
  */
var stack = new Stack(
  alignment: const FractionalOffset(0.5, 0.8),
  children: <Widget>[
    new CircleAvatar(
      backgroundImage:
          new NetworkImage('http://img.bqatj.com/img/161c0d7595eb4947.jpg'),
      radius: 100.0,
    ),
    /*
      * Positioned
      * top:
      */
    new Positioned(
      top: 10.0,
      left: 10.0,
      child: new Text('哈哈哈'),
    ),
    new Positioned(
      bottom: 10.0,
      right: 10.0,
      child: new Text('啦啦啦'),
    ),
  ],
);
```
