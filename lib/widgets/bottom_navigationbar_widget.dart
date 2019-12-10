import 'package:eyepetizer/page/commintiy/communtiy_page.dart';
import 'package:eyepetizer/page/home/home_page.dart';
import 'package:eyepetizer/page/me/me_page.dart';
import 'package:eyepetizer/page/notify/notify_page.dart';
import 'package:eyepetizer/page/publish_add_page.dart';
import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarWidgetState();
  }
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;
  var tabIconArray = [];
  var tabTitleArray = ['首页', '社区', '通知', '我的'];

  Image getTabImage(path) {
    return new Image.asset(
      path,
      width: 25.0,
      height: 25.0,
      fit: BoxFit.cover,
    );
  }

  Image getTabIcon(int currentIndex) {
    if (currentIndex == _currentIndex) {
      return tabIconArray[currentIndex][1];
    }
    return tabIconArray[currentIndex][0];
  }

  Text getTabTitle(int currentIndex) {
    if (currentIndex == _currentIndex) {
      return new Text(tabTitleArray[currentIndex],
          style: new TextStyle(fontSize: 8.0, color: ResColor.tabSelect));
    } else {
      return new Text(tabTitleArray[currentIndex],
          style: new TextStyle(fontSize: 8.0, color: ResColor.tabUnSelect));
    }
  }

  @override
  void initState() {
    super.initState();
    tabIconArray = [
      [
        getTabImage(ResImage.homeUnSelect),
        getTabImage(ResImage.homeSelect),
      ],
      [
        getTabImage(ResImage.communityUnSelect),
        getTabImage(ResImage.communitySelect),
      ],
      [],
      [
        getTabImage(ResImage.notifyUnSelect),
        getTabImage(ResImage.notifySelect),
      ],
      [
        getTabImage(ResImage.meUnSelect),
        getTabImage(ResImage.meSelect),
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showCurrentPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ResColor.white,
        selectedFontSize: 8.0,
        unselectedFontSize: 8.0,
        items: [
          BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
          BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
          BottomNavigationBarItem(
            title: Text("", style: TextStyle(fontSize: 0)),
            icon: Image.asset(
              ResImage.addPublish,
              width: 45.0,
              height: 45.0,
              fit: BoxFit.cover,
            ),
          ),
          BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(2)),
          BottomNavigationBarItem(icon: getTabIcon(4), title: getTabTitle(3)),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            if (index == 2) {
              print("index$index");
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PublishAddPage()));
            } else {
              _currentIndex = index;
            }
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _showCurrentPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return CommuntiyPage();
      case 3:
        return NotifyPage();
      case 4:
        return MePage();
    }
  }
}
