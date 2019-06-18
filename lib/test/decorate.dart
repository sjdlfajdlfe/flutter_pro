import 'package:flutter/material.dart';

class DecorateTest extends StatelessWidget {
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
          title: Text("Container控件")),
      body: MyContainer(),
    );
  }
}

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            gradient: RadialGradient(
                center: Alignment(0, 0),
                radius: 0.5,
                colors: [Colors.red, Colors.black, Colors.blue, Colors.brown])),
        child: Text(
          "Container",
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
