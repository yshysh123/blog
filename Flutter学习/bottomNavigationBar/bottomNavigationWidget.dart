import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/email_screen.dart';
import 'pages/pages_screen.dart';
import 'pages/airplay_screen.dart';

//stful：动态生成widget
/*
 * 继承StateFulWidget
 */
class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

/*
 * 继承State
 */
class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;
  //现在页面的索引
  int _currentIndex = 0;
  //页面的数组
  List<Widget> list = List();

  //重写initState方法
  @override
  void initState() {
    // .. :用完add之后 还返回list 所以可以加载所有的页面 不用一直写list.add
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
    //调用父类的方法
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationColor,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: _BottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _BottomNavigationColor,
            ),
            title: Text(
              'Email',
              style: TextStyle(color: _BottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _BottomNavigationColor,
            ),
            title: Text(
              'Pages',
              style: TextStyle(color: _BottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _BottomNavigationColor,
            ),
            title: Text(
              'Airplay',
              style: TextStyle(color: _BottomNavigationColor),
            ),
          ),
        ],
        //底部导航索引，用于高亮
        currentIndex: _currentIndex,
        //切换tab的响应事件
        onTap: (int index) {
          //把_currentIndex赋值给index
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
