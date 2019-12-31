import 'package:eyepetizer/common/eyepetizer_constants.dart';
import 'package:eyepetizer/model/content_bean_entity.dart';
import 'package:eyepetizer/net/api_eyepetizer.dart';
import 'package:eyepetizer/res/res_color.dart';
import 'package:flutter/material.dart';

import '../listitembuilder_widget.dart';

class DailyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DailyPageState();
  }
}

class _DailyPageState extends State<DailyPage> {
  EyepetizerApi _eyepetizerApi;
  List<ContentBeanItemlist> dailyDatas;

  @override
  void initState() {
    super.initState();
    _eyepetizerApi = EyepetizerApi();
    _eyepetizerApi.fetchDailyDatas((map) {
      ContentBeanEntity entity = map['entity'];
      dailyDatas = entity.itemList;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (dailyDatas == null || dailyDatas.length == 0) {
      return Center(
        child: Text('暂无数据'),
      );
    }
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: dailyDatas.length,
          itemBuilder: _getItemBuilder,
        ),
      ),
    );
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    return ListItemBuilderWidget(datas: dailyDatas, index: index);
  }

}
