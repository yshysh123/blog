```dart
body: new Row(
  children: <Widget>[
    /*
      * 默认 不灵活水平布局
      * Expanded灵活水平布局
      * 可搭配使用
      */
    Expanded(
      child: new RaisedButton(
        onPressed: () {},
        color: Colors.yellowAccent,
        child: new Text('按钮1'),
      ),
    ),
    Expanded(
      child: new RaisedButton(
        onPressed: () {},
        color: Colors.redAccent,
        child: new Text('按钮2'),
      ),
    ),
    new RaisedButton(
      onPressed: () {},
      color: Colors.blueAccent,
      child: new Text('按钮3'),
    ),
  ],
),
```
