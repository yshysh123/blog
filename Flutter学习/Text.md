```dart
child: Text(
  'Hello World123123 啊啊啊啊啊啊 哦哦哦哦哦哦 发额废物积分来看望二级分类可文件分离看文件分类可微积分网络科技',
  /*
    * textAlign参数有center left right start（同left） end（同right）
    */
  textAlign: TextAlign.center,
  /*
    * 最大展示几行
    */
  maxLines: 1,
  /*
    * 超出部分clip 切除  ellipsis超出部分... fade产生渐变从上到下
    */
  overflow: TextOverflow.ellipsis,
  /*
    * 文字的样式 分别为 文字大小 文字颜色  文字下划线 文字下划线样式
    */
  style: TextStyle(
    fontSize: 25.0,
    color: Color.fromARGB(255, 255, 125, 125),
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.dashed,
  ),
),
```
