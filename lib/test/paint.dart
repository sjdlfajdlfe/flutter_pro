import 'dart:ui';

import 'package:flutter/material.dart';

class PaintTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          leading: IconButton(
              icon: new Icon(
                Icons.arrow_back_ios,
              ),
              tooltip: "点击返回",
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text("Paint drawer")),
      body: MyContainer(),
    );
  }
}

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 500, height: 500,child: CustomPaint(painter: LinePainter()));
  }
}

class LinePainter extends CustomPainter {

  Paint _paint = new Paint()
    ..color = Colors.brown
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 3.0
    ..style = PaintingStyle.stroke;
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect  = Rect.fromCenter(center: Offset(200,200),width:300.0,height: 300.0);
    canvas.drawRect(rect, _paint);
    canvas.drawPoints(
        ///PointMode的枚举类型有三个，points点，lines隔点连接线，polygon相邻连接线
        PointMode.polygon,
        [
          Offset(50.0, 60.0),
          Offset(40.0, 90.0),
          Offset(100.0, 100.0),
          Offset(300.0, 350.0),
          Offset(400.0, 80.0),
          Offset(200.0, 200.0),
        ],
        _paint..color = Colors.red);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
