import 'package:flutter/material.dart';

class TooltipsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tooltips Demo'),
      ),
      body: Center(
        child: Tooltip(
          message: '这是一张风景图片',
          child: Image.network(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548680728422&di=f51886dc5f5ab4ba8f12bc144bc9bbfe&imgtype=0&src=http%3A%2F%2Fpic36.photophoto.cn%2F20150730%2F0034034809700328_b.jpg'),
        ),
      ),
    );
  }
}
