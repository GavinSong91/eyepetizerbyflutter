import 'dart:typed_data';

import 'package:eyepetizer/common/eyepetizer_constants.dart';
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
  List<SearchEntity> datas = List();

  String nextPageUrl;

  @override
  void initState() {
    super.initState();
    _api = EyepetizerApi();
    _fetchFollowDatas();
  }

  void _fetchFollowDatas() {
    _api.fetchFollowDatas((map) {
      setState(() {
        datas.clear();
        var entitys = map['entity'] as List<SearchEntity>;
        entitys.forEach((entity) {
          if (entity.type == Constants.Video) {
            datas.add(entity);
          }
        });
        nextPageUrl = map['nextPageUrl'];
      });
    });
  }

  void _fetchMoreFollowDatas() {
    if (nextPageUrl.isEmpty) {
      return;
    }
    _api.fetchMoreFollowDatas(nextPageUrl, (map) {
      setState(() {
        var entitys = map['entity'] as List<SearchEntity>;
        entitys.forEach((entity) {
          if (entity.type == Constants.Video) {
            datas.add(entity);
          }
        });
        nextPageUrl = map['nextPageUrl'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        child: _followWidget(),
        onRefresh: () async {
          _fetchFollowDatas();
        },
        onLoad: () async {
          _fetchMoreFollowDatas();
        },
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: new Image.network(
                  entity.data.author.icon,
                  width: 40.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      entity.data.author.name,
                      softWrap: false,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'LanTing-Bold',
                          color: ResColor.tabSelect),
                    ),
                    Padding(padding: EdgeInsets.only(top: 3)),
                    RichText(
                      softWrap: false,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: '发布：',
                        style: TextStyle(
                          color: ResColor.grey500,
                          fontSize: 12,
                          fontFamily: 'LanTing',
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: entity.data.author.description,
                              style: TextStyle(
                                color: ResColor.tabSelect,
                                fontSize: 12,
                                fontFamily: 'LanTing',
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                flex: 1,
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              entity.data.descriptionPgc,
              softWrap: false,
              maxLines: 3,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ResColor.tabUnSelect,
                fontSize: 13,
                fontFamily: 'LanTing',
              ),
            ),
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
            padding: EdgeInsets.only(top: 10, bottom: 15),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Icon(
                        Icons.favorite_border,
                        color: ResColor.grey500,
                        size: 18,
                      ),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Text(
                        entity.data.consumption.collectionCount.toString(),
                        style: TextStyle(
                            color: ResColor.grey500,
                            fontFamily: 'LanTing',
                            fontSize: 12),
                      )
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.chat,
                        color: ResColor.grey500,
                        size: 18,
                      ),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Text(
                        entity.data.consumption.realCollectionCount.toString(),
                        style: TextStyle(
                            color: ResColor.grey500,
                            fontFamily: 'LanTing',
                            fontSize: 12),
                      )
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        entity.data.consumption.collectionCount.toString(),
                        style: TextStyle(
                            color: ResColor.grey500,
                            fontFamily: 'LanTing',
                            fontSize: 12),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.share,
                          color: ResColor.grey500,
                          size: 18,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
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
