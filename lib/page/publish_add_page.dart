import 'package:eyepetizer/res/res_color.dart';
import 'package:eyepetizer/res/res_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PublishAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ResImage.splashbg), fit: BoxFit.cover),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 150.0),
              child: Column(
                children: <Widget>[
                  Align(
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage(ResImage.gavin_avatar),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  GestureDetector(
                    child: Text.rich(TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: 'Github:',
                        style: TextStyle(color: ResColor.white),
                      ),
                      TextSpan(
                        text: 'https://github.com/GavinSong91',
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ])),
                    onTap: () {
                      _launchURL("https://github.com/GavinSong91");
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'emial:gavinsong91@163.com',
                      style: TextStyle(color: ResColor.white),
                    ),
                  ),
                ],
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
        ),
      ),
    );
  }

  _launchURL(apkUrl) async {
    if (await canLaunch(apkUrl)) {
      await launch(apkUrl);
    } else {
      throw 'Could not launch $apkUrl';
    }
  }
}
