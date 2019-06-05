import 'package:flutter/material.dart';
class FavoritePreview extends StatelessWidget {

  String imgTag;
  String imgUrl;
  FavoritePreview(String imgTag,String imgUrl) {
    this.imgTag = imgTag;
    this.imgUrl = imgUrl;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(backgroundColor:Colors.transparent,appBar: new AppBar(backgroundColor:Colors.transparent,leading: IconButton(icon: new Icon(Icons.arrow_back_ios,),
        tooltip: "点击返回",
        onPressed: () {
          Navigator.pop(context);
        })),body: MyPreview(imgTag,imgUrl),);
  }
}

class MyPreview extends StatelessWidget {

  String imgTag;
  String imgUrl;
  MyPreview(String imgTag,String imgUrl) {
    this.imgTag = imgTag;
    this.imgUrl = imgUrl;
  }

  @override
  Widget build(BuildContext context) {
    print("imgTag: $imgTag  'imgUrl:$imgUrl'");
    return new Center(child: new SizedBox(child:Hero(tag: imgTag, child: Image.network(imgUrl,fit: BoxFit.fill,))),);
  }
}