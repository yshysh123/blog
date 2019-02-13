import 'package:flutter/material.dart';

class ExpansionPanelListDemo extends StatefulWidget {
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  //list里面的元素
  List<int> mList;
  List<ExpandStateBeen> expandStateList;
  //构造方法。类似于生命周期开始
  _ExpansionPanelListDemoState() {
    mList = new List();
    expandStateList = new List();
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBeen(i, false));
    }
  }

  //设置现在打开的索引
  _setCurrentIndex(int index, isExpand) {
    setState(() {
      expandStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelList'),
      ),
      //ExpansionPanelList必须放在可滚动的View里面
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          //打开闭合回调
          expansionCallback: (index, bol) {
            _setCurrentIndex(index, bol);
          },
          //map之后新生成一个数组
          children: mList.map((index) {
            return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text('This is No.$index'),
                );
              },
              body: ListTile(
                title: Text('expansion no.$index'),
              ),
              isExpanded: expandStateList[index].isOpen,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ExpandStateBeen {
  var isOpen;
  var index;
  ExpandStateBeen(this.index, this.isOpen);
}
