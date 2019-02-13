import "package:flutter/material.dart";
import 'keep_alive_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KeepAliveDemo(),
    );
  }
}

//stful快速生成动态杜建
class KeepAliveDemo extends StatefulWidget {
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

// with关键字  可以让一个类继承多个类
// 同时继承SingleTickerProviderStateMixin类
class _KeepAliveDemoState extends State<KeepAliveDemo>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  //重写init方法
  @override
  void initState() {
    super.initState();
    //vsync 来自SingleTickerProviderStateMixin类
    _controller = TabController(length: 3, vsync: this);
  }

  //重写销毁方法，只销毁controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Keep Alive Demo'),
          bottom: TabBar(
            controller: _controller,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[
            MyHomePage(),
            MyHomePage(),
            MyHomePage(),
          ],
        ),
      ),
    );
  }
}
