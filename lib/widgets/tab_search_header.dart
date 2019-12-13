import 'package:eyepetizer/page/search_page.dart';
import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/widgets/tab_indictor.dart';
import 'package:flutter/material.dart';

import 'animation_pageroute.dart';

class TabSearchHeader extends StatelessWidget {
  int initialIndex;
  List<Widget> pageWidget;
  List<Widget> tabWidget;

  TabSearchHeader(
      {Key key,
      this.initialIndex,
      @required this.pageWidget,
      @required this.tabWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialIndex,
      length: tabWidget.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ResColor.grey50,
          title: Stack(
            children: <Widget>[
              Align(
                alignment: FractionalOffset.center,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 * 1.2,
                  alignment: Alignment.center,
                  child: TabBar(
                    //设置tab选中和未选中的属性
                    indicator: TabIndictor(),
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'LanTing',
                        fontWeight: FontWeight.bold),
                    unselectedLabelColor: ResColor.tabUnSelect,
                    unselectedLabelStyle: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'LanTing',
                        fontWeight: FontWeight.bold),
                    indicatorColor: ResColor.tabSelect,
                    //tab点击事件
                    onTap: (index) => {},
                    tabs: tabWidget,
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.centerRight,
                child: IconButton(
                    alignment: Alignment.centerRight,
                    icon: Icon(Icons.search, color: Colors.black),
                    onPressed: () => Navigator.of(context).push(
                        AnimationPageRoute(
                            slideTween: Tween(
                                begin: Offset(0.0, -1.0), end: Offset.zero),
                            builder: (BuildContext context) => SearchPage()))),
              )
            ],
          ),
          bottom: PreferredSize(
            child: Container(
              color: ResColor.dividerLine,
              constraints: BoxConstraints.expand(height: 0.5),
            ),
          ),
        ),
        body: TabBarView(children: pageWidget),
      ),
    );
  }
}
