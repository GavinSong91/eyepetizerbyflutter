import 'package:eyepetizer/common/eyepetizer_constants.dart';
import 'package:eyepetizer/res/res_color.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/model/content_bean_entity.dart';

class ListItemBuilderWidget extends StatelessWidget {
  List<ContentBeanItemlist> datas;
  int index;
  ContentBeanItemlistData itemData;

  ListItemBuilderWidget({Key key, @required this.datas, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContentBeanItemlist result = datas[index];
    itemData = result.data;
    Widget itemWidget;
    switch (result.type) {
      case Constants.TextCard:
        itemWidget = Text(
          result.data.text,
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'LanTing-Bold',
            color: ResColor.tabSelect,
//            fontWeight: FontWeight.w900
          ),
        );
        break;
      case Constants.SquareCardCollection:
        itemWidget = _squareCardCollectionWidget();
        break;
//      case Constants.HorizontalScrollCard:
//        itemWidget = _horizontalListView();
//        break;
    }
    return itemWidget;
  }

  Widget _squareCardCollectionWidget() {

  }

  //横向滑动listview
  Widget _horizontalListView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemData.itemList.length,
        itemBuilder: _horizontalbannerwidget);
  }

  //横向滑动listview的item
  Widget _horizontalbannerwidget(BuildContext context, int index) {
    ContentBeanItemlistData bannerDatas = itemData.itemList[index].data;
    return Card(
      elevation: 0.6,
      child: Container(
        width: 150,
        height: 100,
        child: Image.network(bannerDatas.image),
      ),
    );
  }
}
