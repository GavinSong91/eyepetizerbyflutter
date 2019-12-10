import 'package:flutter/material.dart';

class TabIndictor extends Decoration{
  @override
  BoxPainter createBoxPainter([onChanged]) {
    return _TabIndictorPainter();
  }
}

class _TabIndictorPainter extends BoxPainter{
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;
    final w = 9.0;
    final h = 2.0;
    canvas.drawRect(
        Rect.fromLTWH(offset.dx - w / 2 + configuration.size.width / 2,
            configuration.size.height - 5*h, w, h),
        paint);
  }
}