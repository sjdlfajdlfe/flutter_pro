import 'package:flutter/material.dart';
import 'home/home.dart';
import 'login/login.dart';
import 'package:flutter_pro/db/db_helper.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Login(),
      routes: <String, WidgetBuilder>{
      },
    );
  }
}
//
//class Body extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    DbHelper.getInstace().queryUser(userName)
//  }
//}

