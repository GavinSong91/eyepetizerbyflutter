import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:eyepetizer/widgets/bottom_navigationbar_widget.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => BottomNavigationBarWidget()),
            (route) => route == null);
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animation,
        child: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ResImage.splashbg), fit: BoxFit.cover),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      ResImage.login_logo,
                      width: 120.0,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                'Daily appetizers for your eyes. Bon eyepetit.',
                                style: TextStyle(
                                  color: ResColor.white,
                                  fontSize: 14.0,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'Lobster',
                                ),
                              ),
                            ),
                            Text(
                              '每日精选视频推介，让你大开眼界',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: ResColor.white,
                                fontWeight: FontWeight.w100,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              )),
        ));
  }
}

