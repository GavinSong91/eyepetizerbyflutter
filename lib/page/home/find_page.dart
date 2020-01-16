import 'dart:math';
import 'dart:typed_data';

import 'package:eyepetizer/common/eyepetizer_constants.dart';
import 'package:eyepetizer/model/horizontalcard_data_entity.dart';
import 'package:eyepetizer/model/response_datas.dart';
import 'package:eyepetizer/model/thematic_planning_entity.dart';
import 'package:eyepetizer/model/video_collection_entity.dart';
import 'package:eyepetizer/net/api_eyepetizer.dart';
import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FindPageState();
  }
}

class IntSize {
  const IntSize(this.width, this.height);

  final int width;
  final int height;
}

class _FindPageState extends State<FindPage> {
  EyepetizerApi _eyepetizerApi;
  List<Widget> widgets = List();
  var categorys = [
    '广告',
    '运动',
    '旅行',
    '记录',
    '科技',
    '游戏',
    '搞笑',
    '生活',
    '剧情',
    '创意',
    '影视',
    '音乐',
    '开胃',
    '动画',
    '时尚',
    '综艺'
  ];

  List<IntSize> _createSizes(int count) {
    Random rnd = new Random();
    return new List.generate(count,
        (i) => new IntSize((rnd.nextInt(800) + 500), (rnd.nextInt(800) + 500)));
  }

  List<IntSize> pictureSize;

  @override
  void initState() {
    super.initState();
    pictureSize = _createSizes(16).toList();
    _eyepetizerApi = EyepetizerApi();
    _eyepetizerApi.fetchDiscoveryDatas((map) {
      setState(() {
        widgets.clear();
        List<ItemList> datas = map['entity'];
        datas.forEach((data) {
          if (data.type == Constants.HorizontalScrollCard) {
            var horizontal = HorizontalcardDataEntity.fromJson(data.data);
            widgets.add(generateHorizontalCard(horizontal.itemList));
            widgets.add(generateCategory(categorys, pictureSize));
          } else if (data.type == Constants.SquareCardCollection) {
            var thematic = ThematicPlanningEntity.fromJson(data.data);
            widgets.add(generateCollection(thematic.itemList));
            widgets.add(generatekaiyan());
          } else if (data.type == Constants.VideoCollection) {
            var video = VideoCollectionEntity.fromJson(data.data);
            widgets.add(generateWeekTop(video.itemList));
          }
        });
        widgets.add(generateendRecommendedTopics(categorys, pictureSize));
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

Widget generateWeekTop(List<VideoCollectionDataItemlist> itemList) {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '本周榜单',
              style: TextStyle(fontSize: 18, fontFamily: 'LanTing-Bold'),
            ),
            Expanded(
              child: Text(
                '查看全部 >',
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
        height: 550,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return _generateVideoItem(itemList[index]);
          },
        ),
      )
    ],
  );
}

Widget _generateVideoItem(VideoCollectionDataItemlist itemList) {
  return Container(
    padding: EdgeInsets.only(left: 15, right: 15),
    child: Row(
      children: <Widget>[
        Card(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: itemList.data.cover.detail,
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
                  itemList.data.title,
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
                      '#${itemList.data.category} / 开眼精选',
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

Widget generateendRecommendedTopics(
    List<String> categorys, List<IntSize> pictureSize) {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '推荐主题',
              style: TextStyle(fontSize: 18, fontFamily: 'LanTing-Bold'),
            ),
            Expanded(
              child: Text(
                '查看全部 >',
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
        height: 650,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 9,
          itemBuilder: (context, index) {
            return _generateendTopics(categorys[index], pictureSize[index]);
          },
        ),
      )
    ],
  );
}

Widget _generateendTopics(String data, IntSize size) {
  return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: 'https://picsum.photos/${size.width}/${size.width}/',
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '#$data',
                        style: TextStyle(
                          fontFamily: 'LanTing-Bold',
                          fontSize: 13,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Text(
                        '将军额上能跑马，宰相肚里能乘船',
                        style: TextStyle(
                            fontFamily: 'LanTing',
                            fontSize: 12,
                            color: ResColor.grey600),
                      )
                    ],
                  ),
                ),
                flex: 1,
              ),
              Padding(padding: EdgeInsets.only(left: 30)),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 0, top: 0),
                  //设置 child 居中
                  alignment: Alignment(0, 0),
                  height: 20,
                  width: 40,
                  //边框设置
                  decoration: new BoxDecoration(
                    //背景
                    color: Colors.white,
                    //设置四周圆角 角度
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    //设置四周边框
                    border: new Border.all(width: 1, color: ResColor.tabSelect),
                  ),
                  child: Text(
                    '+关注',
                    style: TextStyle(fontFamily: 'LanTing', fontSize: 10),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            color: ResColor.grey200,
            width: double.infinity,
            height: 1,
          )
        ],
      ));
}

Widget generatekaiyan() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '开眼专栏',
              style: TextStyle(fontSize: 18, fontFamily: 'LanTing-Bold'),
            ),
            Expanded(
              child: Text(
                '查看全部 >',
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
        padding: EdgeInsets.only(left: 15, right: 15),
        width: double.infinity,
        height: 200,
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  'http://img.kaiyanapp.com/80b385aa137e223421c92ee389c99e83.jpeg?imageMogr2/quality/60/format/jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      )
    ],
  );
}

Widget generateCollection(List<ThematicPlanningDataItemlist> itemlists) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '专题策划',
              style: TextStyle(fontSize: 18, fontFamily: 'LanTing-Bold'),
            ),
            Expanded(
              child: Text(
                '查看全部 >',
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
        height: 230,
        child: GridView.builder(
          shrinkWrap: false,
          itemCount: 4,
//          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(left: 15, right: 15),
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //每行8个
              mainAxisSpacing: 1.0, //主轴(竖直)方向间距
              crossAxisSpacing: 1.0, //纵轴(水平)方向间距
              childAspectRatio: 0.7 //纵轴缩放比例
              ),
          itemBuilder: (context, index) {
            return _generateCollectionItem(itemlists[index]);
          },
        ),
      )
    ],
  );
}

Widget _generateCollectionItem(ThematicPlanningDataItemlist itemlist) {
  return Container(
    width: 400,
    height: 400,
    child: Card(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: itemlist.data.image,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget generateCategory(List<String> categorys, List<IntSize> pictureSize) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '热门分类',
              style: TextStyle(fontSize: 18, fontFamily: 'LanTing-Bold'),
            ),
            Expanded(
              child: Text(
                '查看全部分类 >',
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
        height: 230,
        child: GridView.builder(
          shrinkWrap: false,
          itemCount: categorys.length,
//          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(left: 15, right: 15),
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //每行8个
              mainAxisSpacing: 1.0, //主轴(竖直)方向间距
              crossAxisSpacing: 1.0, //纵轴(水平)方向间距
              childAspectRatio: 1.0 //纵轴缩放比例
              ),
          itemBuilder: (context, index) {
            return _generateGridViewItem(categorys[index], pictureSize[index]);
          },
        ),
      )
    ],
  );
}

Widget _generateGridViewItem(String data, IntSize size) {
  return Container(
    width: 200,
    height: 200,
    child: Stack(
      children: <Widget>[
        Card(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: "https://picsum.photos/${size.width}/${size.width}/",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Text(
            '#$data',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'LanTing-Bold',
              color: ResColor.white,
            ),
          ),
        )
      ],
    ),
  );
}

Widget generateendtext() {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Text(
        '-The End-',
        style: TextStyle(fontFamily: 'Lobster', fontSize: 20),
      ),
    ),
  );
}

Widget generateHorizontalCard(List<HorizontalcardDataDataItemlist> itemList) {
  return Container(
    width: double.infinity,
    height: 200,
    padding: EdgeInsets.all(0),
    child: Swiper(
      autoplay: true,
      autoplayDisableOnInteraction: true,
      viewportFraction: 0.9,
//      scale: 0.8,//      pagination: SwiperPagination(),
      controller: SwiperController(),
      itemCount: itemList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: FadeInImage.memoryNetwork(
              width: 500,
              height: 500,
              placeholder: kTransparentImage,
              image: itemList[index].data.image,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
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
