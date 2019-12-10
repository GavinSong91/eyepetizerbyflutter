import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:eyepetizer/utils/toast_util.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  String _userPhone;
  String _userPassword;
  Color _loginColorbg = ResColor.button_unable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ResImage.splashbg),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close, color: Colors.white, size: 24),
                    ),
                    Text(
                      '找回密码',
                      style: TextStyle(color: ResColor.white, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 60.0, bottom: 20.0),
                      child: Image.asset(
                        ResImage.login_logo,
                        width: 150.0,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Text(
                      '登录后即可关注作者、\n发表评论、同步收藏视频和播放记录',
                      style: TextStyle(
                        color: ResColor.white,
                        fontSize: 12.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //用户名
                    Container(
                      margin: EdgeInsets.only(right: 40.0, left: 40.0),
                      decoration: ShapeDecoration(
                        shape: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ResColor.grey100, width: 0.3)),
                      ),
                      child: TextField(
                        autofocus: false,
                        cursorWidth: 1.0,
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        maxLength: 30,
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                        onChanged: (phoneStr) {
                          _userPhone = phoneStr;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            icon: Image.asset(
                              ResImage.account,
                              width: 20.0,
                              height: 20.0,
                            ),
                            //隐藏最大长度提示，这是显示一个空格，不然跟下边框会重合
                            counterText: " ",
                            contentPadding: EdgeInsets.all(-15),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: '请输入手机号/邮箱地址',
                            hintStyle: TextStyle(
                                color: ResColor.white, fontSize: 12.0)),
                      ),
                    ),
                    //密码
                    Container(
                      margin:
                          EdgeInsets.only(right: 40.0, left: 40.0, top: 30.0),
                      decoration: ShapeDecoration(
                        shape: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ResColor.grey100, width: 0.3)),
                      ),
                      child: TextField(
                        autofocus: false,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        cursorWidth: 1.0,
                        cursorColor: Colors.green,
                        maxLines: 1,
                        maxLength: 30,
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                        onChanged: (passwordStr) {
                          _userPassword = passwordStr;
                          setState(() {
                            _changeLoginButtonState();
                          });
                        },
                        decoration: InputDecoration(
                            icon: Image.asset(
                              ResImage.pwd,
                              width: 20.0,
                              height: 20.0,
                            ),
                            //隐藏最大长度提示，这是显示一个空格，不然跟下边框会重合
                            counterText: " ",
                            contentPadding: EdgeInsets.all(-15),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: '请输密码',
                            hintStyle: TextStyle(
                                color: ResColor.white, fontSize: 12.0)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: RaisedButton(
                        padding: EdgeInsets.only(
                            left: 125, right: 125, top: 10, bottom: 10),
                        onPressed: () =>
                            _userPassword.isEmpty || _userPhone.isEmpty
                                ? null
                                : _toLogin(_userPhone, _userPassword),
                        color: _loginColorbg,
                        child: Text('登录',
                            style: TextStyle(
                                color: ResColor.grey700,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            child: Text(
                              "用户注册",
                              style: TextStyle(
                                color: ResColor.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            onTap: () {},
                          ),
                          GestureDetector(
                            child: Text(
                              "作者登录",
                              style: TextStyle(
                                color: ResColor.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                              icon: Image.asset(ResImage.sina),
                              iconSize: 45.0,
                              onPressed: null),
                          IconButton(
                              icon: Image.asset(ResImage.wechat),
                              iconSize: 45.0,
                              onPressed: null),
                          IconButton(
                              icon: Image.asset(ResImage.qq),
                              iconSize: 45.0,
                              onPressed: null),
                        ],
                      ),
                    ),
                    Divider(
                      color: ResColor.grey700,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                      child: GestureDetector(
                        child: Text.rich(TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: '登录或注册即同意开眼',
                            style: TextStyle(
                                color: ResColor.grey700,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w100),
                          ),
                          TextSpan(
                            text: ' 用户服务协议',
                            style: TextStyle(
                                color: ResColor.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w900),
                          )
                        ])),
                        onTap: () {
                          ToastUtil.showToast('用户服务协议');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toLogin(String userAccount, String userPwd) {}

  void _changeLoginButtonState() {
    if (_userPhone.isNotEmpty && _userPassword.isNotEmpty) {
      _loginColorbg = ResColor.button_enable;
    } else {
      _loginColorbg = ResColor.button_unable;
    }
  }
}
