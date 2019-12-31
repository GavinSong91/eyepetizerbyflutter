import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:flutter/material.dart';

class PushMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Container(
          padding: EdgeInsets.only(left: 15.0),
          child: ListView(
            children: <Widget>[
              _itemMessageWidget("2019最后一天", "1小时前", "2019拜拜，2020你好！"),
              _itemMessageWidget("12月30日 开眼资讯精选", "1天前", "日本|李纪桐将回归日本街头，但使用仍十分严格\n墨西哥、专为无家可归的人群建造全球首个3D打印社区\n荷兰|2020年，荷兰将启用新的国家标识"),
              _itemMessageWidget("过去十年了还都实现了", "3天前", "十年前你对自己的幻想，如今实现了几份>>"),
              _itemMessageWidget("2020年也是玩物丧志的废柴", "4天前", "2020的[放弃LIST]>>"),
              _itemMessageWidget("没看过下雪的故宫，我是不会离开北京的", "4天前", "是什么让你坚持留在现在的城市>>"),
              _itemMessageWidget("创作主题：晨昏", "6天前", "想与你分享我的每一个清晨与日落>>"),
              _itemMessageWidget("人生大多数的际会，皆是一期一会", "6天前", "让你难忘的一次[一期一会]"),
              _itemMessageWidget("12月25日 开眼资讯精选", "1天前", "日本|李纪桐将回归日本街头，但使用仍十分严格\n墨西哥、专为无家可归的人群建造全球首个3D打印社区\n荷兰|2020年，荷兰将启用新的国家标识"),
            ],
          ),
        ));
  }

  Widget _itemMessageWidget(String titile, String time, String content) {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage(ResImage.launcher),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      titile,
                      style: TextStyle(fontFamily: "LanTing-Bold"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          time,
                          style:
                              TextStyle(fontSize: 13, color: ResColor.grey700),
                        ),
                        flex: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: ResColor.grey700,
                          size: 15,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      content,
                      style: TextStyle(fontSize: 14.0, color: ResColor.grey700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Container(
                    color: ResColor.grey100,
                    height: 1.0,
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
