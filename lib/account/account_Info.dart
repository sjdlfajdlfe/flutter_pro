import 'package:flutter/material.dart';
class AccountInfoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future<bool> _popPage() {
      print("accountInfo page will pop:${Navigator.canPop(context)}");
      return Future.value(true);
    }
    return WillPopScope(child: new HomePage(), onWillPop: _popPage);
//    return new HomePage();
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
          onPressed: () {
            Navigator.of(context).pop("account info back");
          },
        ),
        title: new Text('AccountInfo'),
        centerTitle: true,
    ),body: new RootPager());
  }
}

class RootPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(onTap: (){
      final snackBar = new SnackBar(content: new Text("点击哈"),);
      Scaffold.of(context).showSnackBar(snackBar);
    },child: Container(width:double.infinity,
      decoration: BoxDecoration(color: Colors.amber),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[Text("用户名"
        ,textAlign: TextAlign.left,style: TextStyle(color: Colors.black,fontSize: 20),),
        Text("booliu",textAlign: TextAlign.right,style: TextStyle(color: Colors.black,fontSize: 10),),]
        ,),
        padding: EdgeInsets.all(10),),
        );
  }
}