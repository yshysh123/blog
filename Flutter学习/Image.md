```dart
 /**
  * Image 组件
  * Image.asset:加载资源图片，就是加载项目资源目录中的图片,加入图片后会增大打包的包体体积，用的是相对路径。
  * Image.file:加载本地图片，就是加载本地文件中的图片，这个是一个绝对路径，跟包体无关。
  * Image.memory: 加载Uint8List资源图片
  * Image.network:网络资源图片，意思就是你需要加入一段http://xxxx.xxx的这样的网络路径地址。
  * fit:
  * BoxFit.contain图片不做任何处理，原图显示，尽量充满Container
  * BoxFit.fill 以容器为基础 图片充满
  * BoxFit.fitWidth 横向充满，纵向不管，图片不会变形
  * BoxFit.fitHeight 纵向充满，横向不管，图片不会变形
  * BoxFit.cover 图片不变形，可能被裁切，充满整个屏幕
  * BoxFit.scaleDown 保持原图片大小。（不写就是这样）
  * colorBlendMode图片混合
  * 1.加一个color颜色
  * 2.colorBlendMode：BlendMode模式，深色亮色等等。
  * darken深色
  * repeat重复
  * ImageRepeat.noRepeat 不重复
  * ImageRepeat.repeat 重复 填满容器
  * ImageRepeat.repeatX 横向重复填满横向
  * ImageRepeat.repeatY 纵向重复填满横向
  */
child: new Image.network(
  'http://img.bqatj.com/img/161c0d7595eb4947.jpg',
  fit: BoxFit.contain,
  color: Colors.greenAccent,
  colorBlendMode: BlendMode.modulate,
  repeat: ImageRepeat.repeatX,
),
```
