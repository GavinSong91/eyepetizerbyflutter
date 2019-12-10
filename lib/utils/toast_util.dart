import 'package:eyepetizer/res/res_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: ResColor.toastbgcolor,
        textColor: ResColor.white,
        fontSize: 14.0);
  }
}
