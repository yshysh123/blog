# Flutter 之 SizedBox

## 第一步 初始化项目

最开始，我们的项目长这个样子

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: child,
      ),
    );
  }
}

```

## 第二步 我们要安装一个第三方库

这个第三方库的作用也非常简单，只供练习使用。作用：为容器提供随机颜色。

- 找到根目录下的 pubspec.yaml 文件
- 在 dev_dependencies：下面的 sdk：flutter 下方 加入第三方库

```dart
dev_dependencies:
  flutter_test:
    sdk: flutter
  random_pk: any
```

💡:注意，random_pk 一定要和 flutter_test 平行，不可和 sdk 评星，不然 flutter 会认为这是 flutter_test 下面的包

- 使用 random_pk 包

```dart
import 'package:random_pk/random_pk.dart';
```

- 使用方法：

```dart
RandomContainer(
  height:100.0,
  width:100.0,
  child:child
)
```

## 第三步 语法

- 获取一个屏幕的宽高

```dart
var deviceSize = MediaQuery.of(context).size;
//使用
SizedBox.formSize(
  size:deviceSize/2,
)
```

- SizeBox 子元素默认拥有该元素宽高

- SizeBox.expand() 撑开父元素宽高

```dart
SizeBox.expand()
```

- SizedOverflowBox 可以撑开 size 的 box 子元素不受 Size 影响

```dart
SizedOverflowBox(size:Size(
  100.0,100.0
))
```

- OverflowBox 可以填写最大最小宽高的 box

```dart
OverflowBox(size:Size(
  100.0,100.0
))
```

- FractionallySizeBox 占父元素宽高比率的 box

```dart
FractionallySizeBox(
  widthFactor:0.5,
  heightFactor:0.5,
)
```

- SizeBox 可以作为 ListView 中间的空隙，比 Padding 可读性更高
