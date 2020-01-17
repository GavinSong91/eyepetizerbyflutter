import 'dart:typed_data';

import 'package:eyepetizer/common/eyepetizer_constants.dart';
import 'package:eyepetizer/model/brief_card_entity.dart';
import 'package:eyepetizer/model/response_datas.dart';
import 'package:eyepetizer/model/search_model.dart';
import 'package:eyepetizer/model/search_video_card_entity.dart';
import 'package:eyepetizer/model/text_card_entity.dart';
import 'package:eyepetizer/model/video_card_entity.dart';
import 'package:eyepetizer/net/api_eyepetizer.dart';
import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:eyepetizer/res/res_string.dart';
import 'package:eyepetizer/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchPage();
  }
}

class _SearchPage extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  String _keyWord = "";
  bool isShowClearbtn = true;
  List<SearchModel> _hotKeyWords = [
    SearchModel('title', '热搜关键词'),
    SearchModel('key', '冬'),
    SearchModel('key', '摄影日常'),
    SearchModel('key', '创意广告'),
    SearchModel('key', '美食'),
    SearchModel('key', '旅行'),
    SearchModel('key', '汽车'),
    SearchModel('key', '黑科技'),
    SearchModel('key', '汽车'),
  ];

  List<Widget> widgets = List();
  AnimationController animationController;
  Animation<int> animation;
  FocusNode searchFieldNode = FocusNode();
  int _pageState = 0;
  String _serachContent = "";
  String _defaultHint = '搜索视频、作者、用户、及标签';
  EyepetizerApi _api;
  String nextPageUrl;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = IntTween(begin: 0, end: 5).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animation.addListener(() {
      setState(() {});
    });
    animationController.forward(from: 0.0);
    _api = EyepetizerApi();
  }

  void _fetchSearch() {
    _api.doSearchByKeyWord(EyepetizerApi.SearchUrl + _keyWord, (map) {
      setState(() {
        nextPageUrl = map['nextPageUrl'];
        List<ItemList> datas = map['entity'];
        widgets.clear();
        if (datas.isEmpty) {
          widgets.add(_contentWidget());
          return;
        }
        datas.forEach((data) {
          print("dataType==>${data.type}");
          if (data.type == Constants.TextCard) {
            var entity = TextCardEntity.fromJson(data.data);
            widgets.add(generateTextCard(entity.text));
          } else if (data.type == Constants.BriefCard) {
            var entity = BriefCardEntity.fromJson(data.data);
            widgets.add(generateBriefCard(entity));
          }
        });
        widgets.add(generateTextCard('视频'));
        datas.forEach((data) {
          if (data.type == Constants.Video) {
            var entity = SearchVideoCardEntity.fromJson(data.data);
            widgets.add(generateVideoCard(entity));
          }
        });
      });
    });
  }

  void _fetchMoreSearch() {
    _api.doSearchByKeyWord(nextPageUrl, (map) {
      setState(() {
        nextPageUrl = map['nextPageUrl'];
        List<ItemList> datas = map['entity'];
        datas.forEach((data) {
          if (data.type == Constants.Video) {
            var entity = SearchVideoCardEntity.fromJson(data.data);
            widgets.add(generateVideoCard(entity));
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: _searchbar(),
          backgroundColor: ResColor.white,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: <Widget>[
            Offstage(
              offstage: !(_pageState == 0),
              child: _searchKeywordsWidget(),
            ),
            Offstage(
              offstage: !(_pageState == 1),
              child: _searchContentWodget(),
            ),
          ],
        ));
  }

  Widget _contentWidget() {
    if (_keyWord.isEmpty) {
      return Center(
        child: Text(
          '空空如也',
          style: TextStyle(
            color: ResColor.tabUnSelect,
            fontSize: 16.0,
          ),
        ),
      );
    }
//    else {
//      print('https://www.toutiao.com/search/?keyword=$_keyWord');
//      return WebView(
//        initialUrl: 'https://www.baidu.com/s?wd=$_keyWord&cl=3',
//        javascriptMode: JavascriptMode.unrestricted,
//        onWebViewCreated: (WebViewController webViewController) {},
//      );
//    }
  }

  Widget _searchKeywordsWidget() {
    return Container(
      child: ListView.builder(
        itemCount: _hotKeyWords.length,
        itemBuilder: _hotKeyWordsBuilder,
      ),
    );
  }

  Widget _hotKeyWordsBuilder(BuildContext context, int index) {
    TextStyle textStyle;
    if (_hotKeyWords[index].type == 'title') {
      textStyle = TextStyle(fontFamily: 'LanTing-Bold', fontSize: 22);
    } else {
      textStyle = TextStyle(color: Colors.lightBlue);
    }
    return GestureDetector(
        onTap: () {
          if (_hotKeyWords[index].type != 'title') {
            setState(() {
              _keyWord = _hotKeyWords[index].content;
              this.isShowClearbtn = _keyWord.isEmpty;
              _fetchSearch();
              _pageState = 1;
            });
//            ToastUtil.showToast(_keyWord);
          }
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            _hotKeyWords[index].content,
            style: textStyle,
          ),
        ));
  }

  Widget _searchbar() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: ResColor.grey100,
                borderRadius: new BorderRadius.all(new Radius.circular(5.0))),
            margin: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 0.0, right: 15.0),
            height: 30.0,
            alignment: Alignment.center,
            child: TextField(
              textInputAction: TextInputAction.search,
              autofocus: false,
              enabled: true,
              style: TextStyle(color: ResColor.tabSelect, fontSize: 12.0),
              // 光标颜色
              cursorColor: Colors.green,
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0.0),
                prefixIcon: Icon(
                  Icons.search,
                  color: ResColor.grey400,
                  size: 20.0,
                ),
                suffixIcon: IconButton(
                    icon: Offstage(
                      offstage: isShowClearbtn,
                      child: Image.asset(
                        ResImage.clear_btn,
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (!isShowClearbtn) {
                          this._keyWord = '';
                          this._pageState = 0;
                          this.isShowClearbtn = true;
                        }
                      });
                    }),
                hintText: '搜索视频、作者、用户、及标签',
                hintStyle: TextStyle(
                  fontFamily: 'LanTing',
                  fontSize: 12.0,
                  color: ResColor.grey400,
                ),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
              onChanged: (contentStr) {
                setState(() {
                  this._keyWord = contentStr;
                  this.isShowClearbtn = _keyWord.isEmpty;
                });
              },
              onEditingComplete: () =>
                  FocusScope.of(context).requestFocus(searchFieldNode),
              onSubmitted: (msg) {
                setState(() {
                  _keyWord = msg;
                  _pageState = 1;
                  this.isShowClearbtn = _keyWord.isEmpty;
                  if (_keyWord.isEmpty) {
                    ToastUtil.showToast("搜就对了");
                  } else {
                    _fetchSearch();
                  }
                });
              },
              controller: TextEditingController.fromValue(
                TextEditingValue(
                    text: '${this._keyWord.isEmpty ? '' : this._keyWord}',
                    selection: TextSelection.fromPosition(TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: '${this._keyWord}'.length))),
              ),
            ),
          ),
          flex: 1,
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Text(
              ResString.cancel,
              style: TextStyle(
                color: ResColor.tabUnSelect,
                fontSize: 14.0,
                fontFamily: 'LanTing',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchContentWodget() {
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
          _fetchSearch();
        },
        onLoad: () async {
          _fetchMoreSearch();
        },
      ),
    );
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    return widgets[index];
  }
}

Widget generateVideoCard(SearchVideoCardEntity entity) {
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
                      '#${entity.category}',
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

Widget generateBriefCard(BriefCardEntity entity) {
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
                  image: entity.icon,
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
                      entity.title,
                      style: TextStyle(
                        fontFamily: 'LanTing-Bold',
                        fontSize: 13,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    Text(
                      entity.description,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
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
    ),
  );
}

Widget generateTextCard(String data) {
  return Container(
    padding: EdgeInsets.only(top: 15, left: 15, bottom: 10),
    child: Text(
      data,
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
