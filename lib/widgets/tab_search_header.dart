import 'package:eyepetizer/page/search_page.dart';
import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/widgets/tab_indictor.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabSearchHeader extends StatelessWidget {
  List<Widget> pageWidget;
  List<Widget> tabWidget;

  TabSearchHeader(
      {Key key, @required this.pageWidget, @required this.tabWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabWidget.length,
      child: Scaffold(
        backgroundColor: ResColor.grey50,
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
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                      unselectedLabelColor: ResColor.tabUnSelect,
                      unselectedLabelStyle: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                      indicatorColor: ResColor.tabSelect,
                      //tab点击事件
                      onTap: (index) => {},
                      tabs: tabWidget),
                ),
              ),
              Align(
                alignment: FractionalOffset.centerRight,
                child: IconButton(
                    alignment: Alignment.centerRight,
                    icon: Icon(Icons.search, color: Colors.black),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SearchPage()))),
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
    );;
  }
}
