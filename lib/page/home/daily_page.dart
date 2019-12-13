import 'package:eyepetizer/res/res_color.dart';
import 'package:flutter/material.dart';

class DailyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DailyPageState();
  }
}

class _DailyPageState extends State<DailyPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ResColor.white,
      child: ListView.builder(
        itemBuilder: null,
      ),
    );
  }
}
