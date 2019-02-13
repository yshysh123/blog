##文字网格列表

```bash
/**
  * GridView.count
  * padding 网格距离外部容器的位置
  * crossAxisSpacing 网格里面每个网格的间距（空格）
  * crossAxisCount 一行显示的个数
  */
body: GridView.count(
  padding: const EdgeInsets.all(20.0),
  crossAxisSpacing: 10.0,
  crossAxisCount: 3,
  children: <Widget>[
    const Text('I am guguhong0'),
    const Text('I am guguhong1'),
    const Text('I am guguhong2'),
    const Text('I am guguhong3'),
    const Text('I am guguhong4'),
    const Text('I am guguhong5'),
  ],
),
```

## 图片网格列表

```bash
/**
  * GridView
  * gridDelegate
  * SliverGridDelegateWithFixedCrossAxisCount
  * crossAxisCount 一行显示的个数
  * mainAxisSpacing 纵轴距离
  * crossAxisSpacing 横轴距离
  * childAspectRatio 横竖比 1.0 宽高一样 2.0 宽/高=2
  * fit: BoxFit.cover 超出部分进行裁切
  */
body: GridView(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 2.0,
    crossAxisSpacing: 2.0,
    childAspectRatio: 0.7,
  ),
  children: <Widget>[
    new Image.network(
        'http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg',
        fit: BoxFit.cover),
    new Image.network(
        'http://img5.mtime.cn/mt/2018/10/10/112514.30587089_180X260X4.jpg',
        fit: BoxFit.cover),
    new Image.network(
        'http://img5.mtime.cn/mt/2018/11/13/093605.61422332_180X260X4.jpg',
        fit: BoxFit.cover),
    new Image.network(
        'http://img5.mtime.cn/mt/2018/11/07/092515.55805319_180X260X4.jpg',
        fit: BoxFit.cover),
    new Image.network(
        'http://img5.mtime.cn/mt/2018/11/21/090246.16772408_135X190X4.jpg',
        fit: BoxFit.cover),
    new Image.network(
        'http://img5.mtime.cn/mt/2018/11/17/162028.94879602_135X190X4.jpg',
        fit: BoxFit.cover),
    new Image.network(
        'http://img5.mtime.cn/mt/2018/11/19/165350.52237320_135X190X4.jpg',
        fit: BoxFit.cover),
    new Image.network(
        'http://img5.mtime.cn/mt/2018/11/16/115256.24365160_180X260X4.jpg',
        fit: BoxFit.cover),
    new Image.network(
        'http://img5.mtime.cn/mt/2018/11/20/141608.71613590_135X190X4.jpg',
        fit: BoxFit.cover),
  ],
),
```
