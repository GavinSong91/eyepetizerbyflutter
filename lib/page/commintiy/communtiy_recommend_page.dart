import 'package:eyepetizer/model/communtiy_recommend_entity.dart';
import 'package:eyepetizer/net/api_eyepetizer.dart';
import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CommuntiyRecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CommuntiyRecommendPage();
  }
}

class _CommuntiyRecommendPage extends State<CommuntiyRecommendPage> with AutomaticKeepAliveClientMixin{
  EyepetizerApi _api;
  List<CommuntiyRecommandItemlist> datas;
  List<CommuntiyRecommandItemlist> pictureFollowdatas;
  List<CommuntiyRecommandItemlistDataItemlist> bannerDatas;

  @override
  void initState() {
    super.initState();
//    _api = EyepetizerApi();
//    _api.fetchCommuntiyRecommend((map) {
//      CommuntiyRecommendEntity entity = map['entity'];
//      datas = entity.itemList;
//      bannerDatas = datas[0].data.itemList;
//      datas.forEach((entity){
//        if (entity.type == 'pictureFollowCard') {
//          pictureFollowdatas.add(entity);
//        }
//      });
//      setState(() {});
//    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                _themeandtopic(),
//                _bannerWidget(),
//                _staggeredGridView(),
              ]),
            ),
          )
        ],
      ),
    );
  }

//  Widget _staggeredGridView() {
//    return Container(
//      child: StaggeredGridView.countBuilder(
//          itemCount:pictureFollowdatas.length,
//      ),
//    );
//  }

  Widget _bannerWidget() {
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
                  bannerDatas[index].data.image,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
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

  @override
  bool get wantKeepAlive => null;
}
