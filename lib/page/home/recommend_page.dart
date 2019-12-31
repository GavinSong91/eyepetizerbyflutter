import 'package:eyepetizer/net/api_eyepetizer.dart';
import 'package:eyepetizer/model/content_bean_entity.dart';
import 'package:flutter/material.dart';

import '../listitembuilder_widget.dart';

class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RecommendPageState();
  }
}

class _RecommendPageState extends State<RecommendPage> {
  EyepetizerApi _eyepetizerApi;
  List<ContentBeanItemlist> recommendDatas;

  @override
  void initState() {
    super.initState();
    _eyepetizerApi = EyepetizerApi();
    _eyepetizerApi.fetchRecommendDatas(0, (map){
      ContentBeanEntity entity = map['entity'];
      recommendDatas = entity.itemList;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (recommendDatas == null || recommendDatas.length == 0) {
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
          itemCount: recommendDatas.length,
          itemBuilder: _getItemBuilder,
        ),
      ),
    );
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    return ListItemBuilderWidget(datas: recommendDatas, index: index);
  }
}
