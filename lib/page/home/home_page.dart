import 'package:eyepetizer/page/home/recommend_page.dart';
import 'package:eyepetizer/res/res_string.dart';
import 'package:eyepetizer/widgets/tab_search_header.dart';
import 'package:flutter/material.dart';

import 'daily_page.dart';
import 'find_page.dart';


class HomePage extends StatelessWidget {
  var pages = [
    FindPage(),
    RecommendPage(),
    DailyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return TabSearchHeader(
      initialIndex: 1,
      pageWidget: <Widget>[
        FindPage(),
        RecommendPage(),
        DailyPage(),
      ],
      tabWidget: <Widget>[
        Tab(
          text: ResString.find_str,
        ),
        Tab(
          text: ResString.recommend_str,
        ),
        Tab(
          text: ResString.dialy_str,
        ),
      ],
    );
  }
}
