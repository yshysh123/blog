import 'package:flutter/material.dart';
import 'dart:ui';

class ForstedClassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //约束性盒子 添加额外的约束条件child
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545738629147&di=22e12a65bbc6c4123ae5596e24dbc5d3&imgtype=0&src=http%3A%2F%2Fpic30.photophoto.cn%2F20140309%2F0034034413812339_b.jpg'),
          ),
          Center(
            //可裁切的矩形
            child: ClipRect(
              //背景过滤器
              child: BackdropFilter(
                //dart:ui里面的过滤器
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 500.0,
                    height: 700.0,
                    decoration: BoxDecoration(
                      //盒子修饰器 颜色灰色 深度200
                      color: Colors.grey.shade200,
                    ),
                    child: Center(
                      child: Text(
                        '毛玻璃效果',
                        //字体修饰皮肤 display4种样式
                        style: Theme.of(context).textTheme.display3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
