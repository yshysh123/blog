```bash
child: Container(
  child: new Text(
    'Hello Yusihong',
    style: TextStyle(fontSize: 40.0),
  ),
  /**
    * alignment
    * topCenter 上对齐居中
    * topLeft  上对齐居左
    * topRight  上对齐居右
    * center 相当于div内容中间对齐
    * centerLeft 相当于div内容中间左对齐
    * centerRight 相当于div内容中间右对齐
    * bottomCenter 下对齐居中
    * bottomLeft 下左对齐
    * bottomRight 下右对齐
    */
  alignment: Alignment.topLeft,
  /**
    * 宽度 高度 颜色
    */
  width: 500.0,
  height: 400.0,
  // color: Colors.lightBlue,
  /**
    * padding EdgeInsets.all(10.0), 上下左右全部10
    * EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 10.0) 分辨代表 左上右下
    */
  padding: const EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 10.0),
  /**
    * margin EdgeInsets.all(10.0), 上下左右全部10
    * EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 10.0) 分辨代表 左上右下
    */
  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
  /**
    * decoration修饰器 主要是针对背景色和边框
    * gradient是背景色
    * LinearGradient是线性渐变 里面填写颜色数组
    * border是边框
    */
  decoration: new BoxDecoration(
    gradient: const LinearGradient(
        colors: [Colors.lightBlue, Colors.lightGreen, Colors.grey]),
    border: Border.all(width: 5.0, color: Colors.red),
  ),
),
```
