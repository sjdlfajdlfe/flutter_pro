import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'home/home.dart';
import 'login/login.dart';
import 'package:flutter_pro/db/db_helper.dart';
import 'generated/i18n.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      localizationsDelegates: [
        I18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales:I18n.delegate.supportedLocales,
      localeResolutionCallback: I18n.delegate.resolution(fallback: new Locale("en","US")),
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

