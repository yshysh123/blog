```dart
import "package:flutter/material.dart";

void main() => runApp(MyApp(
      /**
   * List()非固定长度数组
   * List(1000)固定长度数组
   * List<String>(1000)固定长度且固定类型数组
   * List = [1,2,3] 对List直接赋值
   * generate 生成：
   * 第一个参数 长度
   * 第二个参数 return 方法
   */
      items: new List<String>.generate(1000, (i) => "Item $i"),
    ));

class MyApp extends StatelessWidget {
  /**
   * 构造函数
   * 这是一个构造函数，除了Key，我们增加了一个必传参数，这里的@required意思就必传。
   * :super如果父类没有无名无参数的默认构造函数，则子类必须手动调用一个父类构造函数。
   */
  final List<String> items;
  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(title: Text('Welcome to Flutter')),
        /*
         * new ListView.builder 动态列表
         * itemCount 数组长度
         * itemBuilder 渲染内容 context上下文 index 索引
         */
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}

```
