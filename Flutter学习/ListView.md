## 纵向列表

```bash
body: new ListView(
  children: <Widget>[
    new ListTile(
      leading: new Icon(Icons.apps),
      title: new Text('apps'),
    ),
    new ListTile(
      leading: new Icon(Icons.archive),
      title: new Text('archive'),
    ),
    new ListTile(
      leading: new Icon(Icons.arrow_back),
      title: new Text('arrow_back'),
    ),
    new Image.network(
        'http://jspang.com/static/upload/20190102/9SpnvSzav06JfPUrVtc1hNu9.jpg'),
    new Image.network(
        'http://jspang.com/static/upload/20181213/pvA-e9vkrNiXVFUm6xXMO9zf.jpg'),
    new Image.network(
        'http://jspang.com/static/upload/20181212/RPW7VSlP0xG1UcsMdwPs9MeR.jpg'),
    new Image.network(
        'http://jspang.com/static/upload/20181126/FB4kjZaGt48a4HzYakHWQpU7.png'),
  ],
),
```

##横向列表拆分单独组件

```bash
class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      /**
       * scrollDirection:
       * Axis.horizontal:横向滚动或者叫水平方向滚动。
       * Axis.vertical:纵向滚动或者叫垂直方向滚动。
       */
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        new Container(
          width: 180.0,
          color: Colors.greenAccent,
        ),
        new Container(
          width: 180.0,
          color: Colors.blueAccent,
        ),
        new Container(
          width: 180.0,
          color: Colors.yellowAccent,
        ),
        new Container(
          width: 180.0,
          color: Colors.orangeAccent,
        ),
      ],
    );
  }
}

```
