import 'package:flutter/material.dart';
import 'package:flutter_pro/test/favorite_preview.dart';
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
    List<Favorite> datas = new List();
    for (int i = 0; i < 10; i++) {
      Favorite favorite = new Favorite();
      favorite.tag = i.toString();
      favorite.url = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559568860847&di=ccc79e16aa27e4f3f9cf659a6eefa99d&imgtype=0&src=http%3A%2F%2Ftc.sinaimg.cn%2Fmaxwidth.2048%2Ftc.service.weibo.com%2Fp%2Fimage_youjuke_com%2Fd6cda9b760bee1824645a825a1285edc.jpg';
      DateTime dateTime = DateTime.now();
      favorite.time = "${dateTime.year}年${dateTime.month}月${dateTime.day}日";
      datas.add(favorite);
    }
    return new Scaffold(appBar: new AppBar(title: Text("收藏页面"),
        leading: new IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:() {
          Navigator.of(context).pop("fast food");
        }),),body: GridView.builder(itemCount: datas.length, itemBuilder: (context,index) {
      return new GestureDetector(onTap: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return FavoritePreview(datas[index].tag,datas[index].url);
        }));

      },child:new Container(child: new Column(mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        textDirection: TextDirection.ltr,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[new SizedBox(width:100,child: new Hero(tag: datas[index].tag,child: Image.network(datas[index].url,))),Text(datas[index].time)],),padding: EdgeInsets.all(10),));

      },gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 0),),
      floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
      },tooltip: "显示隐藏",child: Icon(Icons.flip),),);
  }
}

class Favorite {
  String tag;
  String url;
  String time;
}