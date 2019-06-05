import 'package:flutter/material.dart';
class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String url = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1541753399410&di=05760e1c65686b018cf28d440a6ddf5c&imgtype=0&src=http%3A%2F%2Fimg1.cache.netease.com%2Fcatchpic%2FD%2FD7%2FD7D7640C07A00D831EFD2AC270ED7FA7.jpg';
    return new Scaffold(appBar: AppBar(leading: new IconButton(icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },),
      title: Text("跳转动画"),),body: new GestureDetector(
      child: SizedBox(width: 300,child: new Hero(tag: "AABB", child: Image.network(url),)),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => new SecondPage()));
      }),);
  }
}

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("页面切换动画图二"),
      ),
      body: new GestureDetector(
        child: new SizedBox(width:100,child: new Hero(
          tag: "AABB",
          child: new Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1541753399410&di=05760e1c65686b018cf28d440a6ddf5c&imgtype=0&src=http%3A%2F%2Fimg1.cache.netease.com%2Fcatchpic%2FD%2FD7%2FD7D7640C07A00D831EFD2AC270ED7FA7.jpg"),
        ),
      ),onTap: () {
        Navigator.pop(context);
      },),
    );
  }
}