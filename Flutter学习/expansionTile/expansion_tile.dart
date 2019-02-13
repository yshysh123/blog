import "package:flutter/material.dart";

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionTileDemo'),
      ),
      body: Center(
        //可扩展的瓦片
        child: ExpansionTile(
          //不点击的时候展示的内容
          title: Text('Expansion Tile'),
          //左侧图标
          leading: Icon(Icons.ac_unit),
          //打开的背景颜色
          backgroundColor: Colors.white12,
          children: <Widget>[
            ListTile(
              title: Text('list tile'),
              subtitle: Text('subtitle'),
            ),
          ],
          //默认是false不打开  改为true就是打开
          initiallyExpanded: true,
        ),
      ),
    );
  }
}
