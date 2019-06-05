import 'package:flutter/material.dart';
class FastFood extends StatefulWidget {

  @override
  State createState() {
    return new FastFoodState();
  }
}

class FastFoodState extends State {

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
      return new Scaffold(appBar: new AppBar(title: Text("收藏页面"),
        leading: new IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:() {
          Navigator.of(context).pop("fast food");
        }),),body: new Center(child: new AnimatedOpacity(opacity: isVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 1000),
        child: new Container(width: 300,height: 300,color: Colors.deepPurple,),),),
      floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
      },tooltip: "显示隐藏",child: Icon(Icons.flip),),);
  }
}