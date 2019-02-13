import 'package:flutter/material.dart';
import 'each_view.dart';

class BottomAppBarDemo extends StatefulWidget {
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  List<Widget> _eachView;
  int _index = 0;
  //init 自动生成
  @override
  void initState() {
    _eachView = List();
    _eachView..add(EachView('Home'))..add(EachView('Airplay'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //点击之后打开新页面，传递New Page过去
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return EachView('New Page');
            }),
          );
        },
        tooltip: 'FAB',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      //floatingActionButton融合在在居中一起
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //底部工具栏 比navigationBar灵活
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        //和floatingActionButton融合的缺口
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airplay),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
