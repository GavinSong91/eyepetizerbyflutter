import 'package:eyepetizer/page/commintiy/communtiy_follow_page.dart';
import 'package:eyepetizer/res/res_string.dart';
import 'package:eyepetizer/widgets/tab_search_header.dart';
import 'package:flutter/material.dart';
import 'communtiy_recommend_page.dart';

class CommuntiyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabSearchHeader(
      initialIndex: 0,
      pageWidget: <Widget>[
        CommuntiyRecommendPage(),
        CommuntiyFollowPage(),
      ],
      tabWidget: <Widget>[
        Tab(
          text: ResString.recommend_str,
        ),
        Tab(
          text: ResString.follow_str,
        )
      ],
    );
  }
}
