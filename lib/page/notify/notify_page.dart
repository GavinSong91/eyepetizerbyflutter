import 'package:eyepetizer/page/home/recommend_page.dart';
import 'package:eyepetizer/page/notify/unlogin_page.dart';
import 'package:eyepetizer/res/res_string.dart';
import 'package:eyepetizer/widgets/tab_search_header.dart';
import 'package:flutter/material.dart';

class NotifyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabSearchHeader(
      pageWidget: <Widget>[
        RecommendPage(),
        unLogingPage(),
        unLogingPage(),
      ],
      tabWidget: <Widget>[
        Tab(
          text: ResString.pushmsg_str,
        ),
        Tab(
          text: ResString.interaction_str,
        ),
        Tab(
          text: ResString.personalletter_str,
        ),
      ],
    );
  }
}
