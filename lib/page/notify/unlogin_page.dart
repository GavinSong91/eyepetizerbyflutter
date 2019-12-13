import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:flutter/material.dart';

import '../login_page.dart';

class unLogingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      color: ResColor.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Image.asset(
              ResImage.unlogintip,
              width: 100.0,
              height: 100.0,
            ),
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.only(top: 35.0, bottom: 10.0),
              child: Text(
                '别错过重要的信息',
                style: TextStyle(
                    color: ResColor.tabSelect,
                    fontSize: 15.0,
                    fontFamily: 'LanTing-Bold'),
              ),
            ),
          ),
          Align(
            child: Text(
              '登录后即可查看评论回复、点赞及关注等通知消息',
              style: TextStyle(
                  color: ResColor.grey700,
                  fontSize: 12.0,
                  fontFamily: 'LanTing'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: RaisedButton(
              padding:
                  EdgeInsets.only(left: 120, right: 120, top: 9, bottom: 9),
              child: Text(
                '登录',
                style: TextStyle(
                    color: ResColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              color: Colors.indigo,
              onPressed: () =>_toLogin(context),
            ),
          ),
        ],
      ),
    ));
  }

  void _toLogin(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
