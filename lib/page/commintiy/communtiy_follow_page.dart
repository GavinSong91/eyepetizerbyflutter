import 'dart:typed_data';

import 'package:eyepetizer/net/api_eyepetizer.dart';
import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:eyepetizer/model/search_entity.dart';

class CommuntiyFollowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CommuntiyFollowPage();
  }
}

class _CommuntiyFollowPage extends State<CommuntiyFollowPage> {
  EyepetizerApi _api;
  List<SearchEntity> datas;
  String nextPageUrl;

  @override
  void initState() {
    super.initState();
    _api = EyepetizerApi();
    _api.fetchFollowDatas((map) {
      datas = map['entity'];
      nextPageUrl = map['nextPageUrl'];
    });
  }

  /* ,*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        child: _followWidget(),
      ),
    );
  }

  Widget _followWidget() {
    if (datas == null) {
      return _loginWidage();
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _loginWidage();
        }
        return _followItemWidget(datas[index - 1]);
      },
      itemCount: datas.length + 1,
    );
  }

  Widget _followItemWidget(SearchEntity entity) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: new Image.network(
                  entity.data.author.icon,
                  width: 30.0,
                ),
              ),
              Column(
                children: <Widget>[
                  Expanded(
                    child: Text(entity.data.author.name),
                    flex: 1,
                  ),
                  Expanded(
                    child: Text(entity.data.author.description),
                    flex: 1,
                  ),
                ],
              )
            ],
          ),
          Card(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: entity.data.cover.feed,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.collections),
                      Text(entity.data.consumption.collectionCount.toString())
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.collections),
                      Text(entity.data.consumption.collectionCount.toString())
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.collections),
                      Text(entity.data.consumption.collectionCount.toString())
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.share),
                      ],
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
          Container(
            color: ResColor.grey100,
            height: 1,
          )
        ],
      ),
    );
  }

  Widget _loginWidage() {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              ResImage.defaultavatar,
              width: 70,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 50),
              child: Text(
                '点击登录后可关注主题和作者',
                style: TextStyle(
                  fontSize: 13,
                  color: ResColor.grey400,
                  fontFamily: 'LanTing',
                ),
              ),
            ),
            Container(
              color: ResColor.grey300,
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}

final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);
