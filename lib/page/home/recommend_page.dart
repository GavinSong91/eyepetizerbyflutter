import 'dart:typed_data';

import 'package:eyepetizer/common/eyepetizer_constants.dart';
import 'package:eyepetizer/model/response_datas.dart';
import 'package:eyepetizer/model/banner_ad_entity.dart';
import 'package:eyepetizer/model/square_collection_entity.dart';
import 'package:eyepetizer/model/video_card_entity.dart';
import 'package:eyepetizer/net/api_eyepetizer.dart';
import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RecommendPageState();
  }
}

class _RecommendPageState extends State<RecommendPage> {
  EyepetizerApi _eyepetizerApi;
  List<Widget> widgets = List();

  @override
  void initState() {
    super.initState();
    _eyepetizerApi = EyepetizerApi();
    _eyepetizerApi.fetchRecommendDatas((map) {
      setState(() {
        widgets.clear();
        List<ItemList> datas = map['entity'];
        datas.forEach((data) {
          if (data.type == Constants.SquareCardCollection) {
            var entity = SquareCollectionEntity.fromJson(data.data);
            widgets.add(generateCollection(entity.itemList));
          } else if (data.type == Constants.BannerAD) {
            var entity = BannerAdEntity.fromJson(data.data);
            widgets.add(generateBannerAD(entity));
          } else if (data.type == Constants.VideoSmallCard) {
            var entity = VideoCardEntity.fromJson(data.data);
            widgets.add(generateVideoCard(entity));
          }
        });
        widgets.add(generateendtext());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widgets == null || widgets.length == 0) {
      return Center(
        child: Text('暂无数据'),
      );
    }
    return SafeArea(
      top: false,
      bottom: false,
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: widgets.length,
        itemBuilder: _getItemBuilder,
      ),
    );
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    return Container(
      child: widgets[index],
    );
  }
}

Widget generateVideoCard(VideoCardEntity entity) {
  return Container(
    padding: EdgeInsets.only(left: 15, right: 15),
    child: Row(
      children: <Widget>[
        Card(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: entity.cover.detail,
              fit: BoxFit.cover,
              width: 160,
              height: 100,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        Expanded(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  entity.title,
                  maxLines: 2,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'LanTing-Bold',
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '#${entity.category} / 开眼精选',
                      style: TextStyle(
                          fontFamily: 'LanTing',
                          fontSize: 12,
                          color: ResColor.grey400),
                    ),
                    Image.asset(ResImage.share,
                        width: 35, height: 35, color: ResColor.grey400)
                  ],
                ),
              ],
            ),
          ),
          flex: 1,
        )
      ],
    ),
  );
}

Widget generateBannerAD(BannerAdEntity entity) {
  return Container(
    padding: EdgeInsets.only(left: 15, right: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: Stack(
                children: <Widget>[
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: entity.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 180,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(right: 10, top: 10),
                      //设置 child 居中
                      alignment: Alignment(0, 0),
                      height: 20,
                      width: 40,
                      //边框设置
                      decoration: new BoxDecoration(
                        //背景
                        color: ResColor.hexColor(0x000000, alpha: 0.2),
                        //设置四周圆角 角度
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        //设置四周边框
                        border:
                            new Border.all(width: 0.5, color: ResColor.white),
                      ),
                      child: Text(
                        '广告',
                        style: TextStyle(
                            fontFamily: 'LanTing-Bold',
                            fontSize: 10,
                            color: ResColor.white),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: entity.header.icon,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 15)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    entity.header.title,
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
                    entity.header.description,
                    style: TextStyle(
                        fontFamily: 'LanTing',
                        fontSize: 12,
                        color: ResColor.grey400),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          color: ResColor.grey300,
          width: double.infinity,
          height: 1,
        ),
        Padding(
          padding: EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            '猜你喜欢',
            style: TextStyle(fontSize: 18, fontFamily: 'LanTing-Bold'),
          ),
        )
      ],
    ),
  );
}

Widget generateendtext() {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(top: 40, bottom: 40),
      child: Text(
        '-The End-',
        style: TextStyle(fontFamily: 'Lobster', fontSize: 20),
      ),
    ),
  );
}

Widget generateCollection(List<SquareCollectionDataItemlist> itemList) {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '每日开眼精选',
              style: TextStyle(fontSize: 18, fontFamily: 'LanTing-Bold'),
            ),
            Expanded(
              child: Text(
                '查看往期 >',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'LanTing-Bold',
                    color: ResColor.blue_700),
                textAlign: TextAlign.right,
              ),
              flex: 1,
            )
          ],
        ),
      ),
      Container(
        width: double.infinity,
        height: 730,
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              return _generateCollectionItem(itemList[index]);
            }),
      )
    ],
  );
}

Widget _generateCollectionItem(SquareCollectionDataItemlist itemList) {
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
                    image: itemList.data.content.data.cover.detail,
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
                  itemList.data.header.icon,
                  width: 35.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 13)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      itemList.data.header.title,
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
                      '开眼精选 / #${itemList.data.content.data.category}',
                      style: TextStyle(
                          fontFamily: 'LanTing',
                          fontSize: 12,
                          color: ResColor.grey400),
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
