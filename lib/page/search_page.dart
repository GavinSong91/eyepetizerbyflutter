import 'package:eyepetizer/model/search_model.dart';
import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:eyepetizer/res/res_string.dart';
import 'package:eyepetizer/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchPage();
  }
}

class _SearchPage extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  String _keyWord = "";
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

  AnimationController animationController;
  Animation<int> animation;
  FocusNode searchFieldNode = FocusNode();
  int _pageState = 0;
  bool _isShowClearbtn = true;
  String _serachContent = "";

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
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController.fromValue(
      TextEditingValue(
          text: _serachContent,
          selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream,
            offset: _serachContent.length,
          ))),
    );
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
              child: _contentWidget(),
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
    } else {
      print('https://www.toutiao.com/search/?keyword=$_keyWord');
      return WebView(
        initialUrl: 'https://www.baidu.com/s?wd=$_keyWord&cl=3',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {},
      );
    }
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
              _pageState = 1;
            });
            ToastUtil.showToast(_keyWord);
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
              autofocus: true,
              style: TextStyle(color: ResColor.tabSelect, fontSize: 12.0),
              cursorColor: Colors.green,
              maxLines: 1,
              // 光标颜色
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0.0),
                prefixIcon: Icon(
                  Icons.search,
                  color: ResColor.grey400,
                  size: 20.0,
                ),
               /* suffixIcon: IconButton(
                    icon: Offstage(
                      offstage: _isShowClearbtn,
                      child: Image.asset(
                        ResImage.clear_btn,
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    onPressed: () {}),*/
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
                  _isShowClearbtn = contentStr.isEmpty;
                });
              },
              onEditingComplete: () =>
                  FocusScope.of(context).requestFocus(searchFieldNode),
              onSubmitted: (msg) {
                setState(() {
                  _keyWord = msg;
                  _pageState = 1;
                });
              },
//              controller: textController,
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
}
