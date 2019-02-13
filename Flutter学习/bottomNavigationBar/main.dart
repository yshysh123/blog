import 'package:flutter/material.dart';
import './bottomNavigationWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottomNavigationBar',
      /**皮肤 */
      theme: ThemeData.light(),
      home: BottomNavigationWidget(),
    );
  }
}
