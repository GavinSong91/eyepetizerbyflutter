import 'package:eyepetizer/net/api_eyepetizer.dart';
import 'package:eyepetizer/model/content_bean_entity.dart';
import 'package:eyepetizer/page/listitembuilder_widget.dart';
import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FindPageState();
  }
}

class _FindPageState extends State<FindPage> {
  EyepetizerApi _eyepetizerApi;
  List<ContentBeanItemlist> discoverDatas;

  @override
  void initState() {
    super.initState();
    _eyepetizerApi = EyepetizerApi();
    _eyepetizerApi.fetchDiscoveryDatas((map) {
      ContentBeanEntity entity = map['entity'];
      discoverDatas = entity.itemList;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (discoverDatas == null || discoverDatas.length == 0) {
      return Center(
        child: Text('暂无数据'),
      );
    }
    print('discoverDatas.length->${discoverDatas.length}');
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: discoverDatas.length,
          itemBuilder: _getItemBuilder,
        ),
      ),
    );
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    return ListItemBuilderWidget(datas: discoverDatas, index: index);
  }
}
