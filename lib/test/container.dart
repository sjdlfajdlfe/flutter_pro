import 'package:flutter/material.dart';
class ContainerTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(leading: IconButton(icon: new Icon(Icons.arrow_back_ios,),
        tooltip: "点击返回",
        onPressed: () {
          Navigator.pop(context);
        }),title: Text("Container控件")),body: MyContainer(),);
  }
}

class MyContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return new Center(child: new Container(width: 300,height: 300,
        decoration: BoxDecoration(color:Colors.deepPurple,
            border: Border.all(color: Colors.green,width: 8,)
            ,borderRadius: BorderRadius.all(Radius.circular(48))),
        child: Text("Container",textAlign: TextAlign.center,),alignment: Alignment.center,),);
  }
}