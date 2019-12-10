import 'package:eyepetizer/res/res_color.dart';
import 'package:flutter/material.dart';

class LeftIconTextWidget extends StatelessWidget {
  String lfetIcon;
  String textStr;

  LeftIconTextWidget({Key key, @required this.lfetIcon, @required this.textStr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          lfetIcon,
          color: ResColor.grey700,
          width: 45.0,
          height: 45.0,
        ),
        Text(
          textStr,
          style: TextStyle(
            color: ResColor.grey700,
            fontSize: 14.0,
          ),
        )
      ],
    );
  }
}
