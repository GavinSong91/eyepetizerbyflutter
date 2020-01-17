import 'dart:typed_data';

import 'package:eyepetizer/common/eyepetizer_constants.dart';
import 'package:eyepetizer/model/itemlist_entity.dart';
import 'package:eyepetizer/net/api_eyepetizer.dart';
import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

class CommuntiyRecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CommuntiyRecommendPage();
  }
}

class _CommuntiyRecommendPage extends State<CommuntiyRecommendPage> {
  EyepetizerApi _api;
  String nextPageUrl;
  List<ItemlistEntity> bannerDatas = List();
  List<ItemlistEntity> pictureDatas = List();

  @override
  void initState() {
    super.initState();
    _api = EyepetizerApi();
    _fetchCommuntityRecommend();
  }

  void _fetchCommuntityRecommend() {
    pictureDatas.clear();
    bannerDatas.clear();
    _api.fetchCommuntiyRecommend((map) {
      setState(() {
        var entitys = map['entity'];
        nextPageUrl = map['nextPageUrl'];
        entitys.forEach((data) {
          if (data.type == Constants.PictureFollowCard ||
              data.type == Constants.AutoPlayFollowCard) {
            pictureDatas.add(data);
          } else {
            bannerDatas.add(data);
          }
        });
      });
    });
  }

  void _loadMoreCommuntityRecommend() {
    _api.fetchMoreCommuntiyRecommend(nextPageUrl, (map) {
      setState(() {
        var entitys = map['entity'];
        nextPageUrl = map['nextPageUrl'];
        entitys.forEach((data) {
          if (data.type == Constants.PictureFollowCard ||
              data.type == Constants.AutoPlayFollowCard) {
            pictureDatas.add(data);
          } else {
            bannerDatas.add(data);
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: EasyRefresh(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        child: StaggeredGridView.countBuilder(
          itemCount: pictureDatas.length,
          primary: false,
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemBuilder: (context, index) =>
              _staggeredItemBuilder(pictureDatas[index]),
          staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        ),
        onRefresh: () async {
          _fetchCommuntityRecommend();
        },
        onLoad: () async {
          _loadMoreCommuntityRecommend();
        },
      ),
    );
  }

  Widget _staggeredItemBuilder(ItemlistEntity entity) {
    return Column(
      children: <Widget>[
        Card(
          child: Stack(
            children: <Widget>[
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: entity.data.content.data.cover.feed,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 3, bottom: 5),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              entity.data.content.data.description,
              softWrap: false,
              maxLines: 3,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: ResColor.tabSelect,
                  fontSize: 12,
                  fontFamily: 'LanTing'),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 3),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: new Image.network(
                    entity.data.header.icon,
                    width: 20.0,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      entity.data.header.issuerName,
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: ResColor.grey600,
                          fontSize: 12,
                          fontFamily: 'LanTing'),
                    ),
                  ),
                  flex: 1,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      entity.data.content.data.consumption.collectionCount
                          .toString(),
                      style: TextStyle(
                          color: ResColor.tabSelect,
                          fontSize: 12,
                          fontFamily: 'LanTing'),
                    ),
                    Image.asset(
                      ResImage.heart,
                      color: ResColor.grey600,
                      width: 35.0,
                      height: 35.0,
                    ),
                  ],
                ),
              ],
            )),
      ],
    );
  }

  Widget _themeandtopic() {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                image: DecorationImage(
                    image: AssetImage(
                      ResImage.theme_creation_square,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '主题创作广场',
                      style: TextStyle(
                        color: ResColor.white,
                        fontFamily: 'LanTing-Bold',
                      ),
                    ),
                    Text(
                      '发布你的作品和日常',
                      style: TextStyle(
                        color: ResColor.white,
                        fontFamily: 'LanTing',
                      ),
                    )
                  ],
                ),
              ),
            ),
            flex: 1,
          ),
          Padding(padding: EdgeInsets.all(5.0)),
          Expanded(
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                image: DecorationImage(
                    image: AssetImage(
                      ResImage.splashbg,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '话题讨论大厅',
                      style: TextStyle(
                        color: ResColor.white,
                        fontFamily: 'LanTing-Bold',
                      ),
                    ),
                    Text(
                      '分享你的故事和观点',
                      style: TextStyle(
                        color: ResColor.white,
                        fontFamily: 'LanTing',
                      ),
                    )
                  ],
                ),
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }

/*Widget _bannerWidget() {
    return Container(
      height: 180,
      margin: EdgeInsets.only(top: 10.0, left: 15.0),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: bannerDatas.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(right: 5.0),
              width: 330,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: Image.network(
                  bannerDatas[index].data,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }*/
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
