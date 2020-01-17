import 'dart:typed_data';

import 'package:eyepetizer/common/eyepetizer_constants.dart';
import 'package:eyepetizer/model/follow_card_entity.dart';
import 'package:eyepetizer/model/response_datas.dart';
import 'package:eyepetizer/model/text_card_entity.dart';
import 'package:eyepetizer/net/api_eyepetizer.dart';
import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

class DailyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DailyPageState();
  }
}

class _DailyPageState extends State<DailyPage> {
  EyepetizerApi _eyepetizerApi;
  List<Widget> widgets = List();
  String nextPageUrl;

  @override
  void initState() {
    super.initState();
    _eyepetizerApi = EyepetizerApi();
    _eyepetizerApi.fetchDailyDatas((map) {
      setState(() {
        widgets.clear();
        List<ItemList> datas = map['entity'];
        datas.forEach((data) {
          if (data.type == Constants.TextCard) {
            var entity = TextCardEntity.fromJson(data.data);
            if (entity.text != '今日社区精选') {
              widgets.add(generateTextWidget(entity.text));
            }
          } else if (data.type == Constants.FollowCard) {
            var entity = FollowCardEntity.fromJson(data.data);
            widgets.add(generateFollowCard(entity));
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widgets.isEmpty) {
      return Center(
        child: Text('暂无数据'),
      );
    } else {
      return SafeArea(
        top: false,
        bottom: false,
        child: EasyRefresh(
          header: MaterialHeader(),
          footer: MaterialFooter(),
          child: ListView.builder(
            itemCount: widgets.length,
            itemBuilder: _getItemBuilder,
          ),
          onRefresh: () async {
            _fetchDaily();
          },
          onLoad: () async {
            _loadMoreDaily();
          },
        ),
      );
    }
    /*   return SafeArea(
      top: false,
      bottom: false,
      child:
    );*/
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    return widgets[index];
  }

  void _fetchDaily() {
    _eyepetizerApi.fetchDailyDatas((map) {
      setState(() {
        widgets.clear();
        List<ItemList> datas = map['entity'];
        nextPageUrl = map['nextPageUrl'];
        datas.forEach((data) {
          if (data.type == Constants.TextCard) {
            var entity = TextCardEntity.fromJson(data.data);
            if (entity.text != '今日社区精选') {
              widgets.add(generateTextWidget(entity.text));
            }
          } else if (data.type == Constants.FollowCard) {
            var entity = FollowCardEntity.fromJson(data.data);
            widgets.add(generateFollowCard(entity));
          }
        });
      });
    });
  }

  void _loadMoreDaily() {
    _eyepetizerApi.fetchMoreDailyDatas(nextPageUrl, (map) {
      setState(() {
        List<ItemList> datas = map['entity'];
        nextPageUrl = map['nextPageUrl'];
        datas.forEach((data) {
          if (data.type == Constants.TextCard) {
            var entity = TextCardEntity.fromJson(data.data);
            if (entity.text != '今日社区精选') {
              widgets.add(generateTextWidget(entity.text));
            }
          } else if (data.type == Constants.FollowCard) {
            var entity = FollowCardEntity.fromJson(data.data);
            widgets.add(generateFollowCard(entity));
          }
        });
      });
    });
  }
}

Widget generateFollowCard(FollowCardEntity entity) {
  return Container(
    padding: EdgeInsets.only(left: 15, right: 15),
    child: Column(
      children: <Widget>[
        Card(
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: Stack(
                children: <Widget>[
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: entity.content.data.cover.detail,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 180,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '09:42',
                      style: TextStyle(
                          fontFamily: 'LanTing', color: ResColor.white),
                    ),
                  )
                ],
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipOval(
                child: new Image.network(
                  entity.header.icon,
                  width: 35.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 13)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      entity.content.data.title,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'LanTing-Bold',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    Text(
                      '开眼精选 / #${entity.content.data.category}',
                      style: TextStyle(
                          fontFamily: 'LanTing',
                          fontSize: 12,
                          color: ResColor.tabUnSelect),
                    ),
                  ],
                ),
              ),
              Image.asset(
                ResImage.share,
                width: 35,
                height: 35,
                color: ResColor.grey400,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          color: ResColor.grey100,
          width: double.infinity,
          height: 1,
        )
      ],
    ),
  );
}

Widget generateTextWidget(String text) {
  return Container(
    padding: EdgeInsets.only(top: 15, left: 15, bottom: 10),
    child: Text(
      text,
      style: TextStyle(fontSize: 18, fontFamily: 'LanTing-Bold'),
    ),
  );
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
