import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:eyepetizer/res/res_string.dart';
import 'package:eyepetizer/utils/toast_util.dart';
import 'package:eyepetizer/widgets/lefticon_text_widget.dart';
import 'package:flutter/material.dart';

import '../login_page.dart';

class MePage extends StatelessWidget {
  List<String> _datas = [
    ResString.my_follow,
    ResString.my_watchrecord,
    ResString.notify_switch,
    ResString.my_badge,
    ResString.feedback,
    ResString.contribute,
    "Version 6.0.507"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ResColor.white,
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: IconButton(
                      iconSize: 45.0,
                      icon: Image.asset(
                        ResImage.more,
                        color: ResColor.tabSelect,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () => _toLogin(context)))),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                _toLogin(context);
              },
              child: Column(
                children: <Widget>[
                  Image.asset(
                    ResImage.defaultavatar,
                    width: 70.0,
                    height: 70.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Text(
                      '点击登录即可评论及发布内容',
                      style: TextStyle(
                        color: ResColor.grey700,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: LeftIconTextWidget(
                      lfetIcon: ResImage.heart, textStr: "收藏"),
                  onTap: () => ToastUtil.showToast('收藏'),
                ),
                flex: 1,
              ),
              Container(
                width: 1,
                height: 20,
                color: ResColor.tabUnSelect,
              ),
              Expanded(
                child: GestureDetector(
                  child: LeftIconTextWidget(
                      lfetIcon: ResImage.download, textStr: "缓存"),
                  onTap: () => ToastUtil.showToast('缓存'),
                ),
                flex: 1,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            width: double.infinity,
            height: 1.0,
            color: ResColor.grey400,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0.0),
              itemCount: _datas.length,
              itemBuilder: _itemBuilder,
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    TextStyle textStyle;
    double paddingBottom = 0;
    if (index == _datas.length - 1) {
      textStyle = TextStyle(fontSize: 10.0, color: ResColor.grey400,fontFamily: 'LanTing');
      paddingBottom = 10.0;
    } else {
      textStyle = TextStyle(fontSize: 14.0, color: ResColor.tabUnSelect);
    }

    return GestureDetector(
      onTap: () {
        ToastUtil.showToast(_datas[index]);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 50, bottom: paddingBottom),
        child: Text(_datas[index], style: textStyle),
      ),
    );
  }

  void _toLogin(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
