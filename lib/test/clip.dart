import 'package:flutter/material.dart';

class ClipTest extends StatelessWidget {
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
    var avatar =
        'http://sandbox-ugc.boochat.cn/avatar/2019/01/19/14/178d257b-386c-4a5a-b312-bcca13e086e1.png';
    return new Center(
        child: ClipPath(
      clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          textDirection: TextDirection.ltr),
      child: Container(
        color: Colors.brown,
        width: 300,
        height: 300,
        child: Image.network(
          avatar,
          fit: BoxFit.fill,
        ),
      ),
    ));
  }
}
