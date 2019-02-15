```dart
home: Scaffold(
  appBar: new AppBar(
    title: new Text('垂直布局'),
  ),
  /*
    * Column 垂直布局
    * mainAxisAlignment主轴对齐方式
    *  MainAxisAlignment.start 左对齐
    *  MainAxisAlignment.center 居中对齐
    *  MainAxisAlignment.end 右对齐
    * crossAxisAlignment副轴对齐方式
    * CrossAxisAlignment.start 左对齐
    * CrossAxisAlignment.center 居中对齐
    * CrossAxisAlignment.end 右对齐
    */
  body: new Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('hello'),
        Expanded(
          child: Text('world'),
        ),
        Text('hahahahahahahahahhaha'),
        Text('hello'),
      ],
    ),
  ),
),
```
