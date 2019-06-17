import 'package:flutter/material.dart';
import 'package:flutter_pro/db/db_helper.dart';
import 'package:flutter_pro/home/home.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  State createState() {
    return LoginState();
  }
}

class LoginState extends State {
  String userName;
  String password;
  GlobalKey<FormFieldState> userNameKey = new GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> userPasswordKey = new GlobalKey<FormFieldState>();
  void login(BuildContext context) {
    var userNameState = userNameKey.currentState;
    if (userNameState.validate()) {
      userNameState.save();
    }
    var passwordState = userPasswordKey.currentState;
    if (passwordState.validate()) {
      passwordState.save();
    }
    DbHelper.getInstace().insertUser(userName, password).then((value) {
      return DbHelper.getInstace().queryUser(userName);
    }).then((value) {
      //测试 查询插入的数据是否正确
      print("userNmae:${value.userName}  'userPassword: ${value.password}'");
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new MyHomePage()));
    });
  }

  static Future<void> pop() async {
    await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = new TextEditingController();
    controller.addListener(() {
      print("input content:${controller.text} value:${controller.selection}");
    });
    return new MaterialApp(
      title: "登录",
      home: new Scaffold(
        appBar: AppBar(
          title: Text("登录"),
        ),
        body: new Container(
          margin: EdgeInsets.only(top: 100),
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          child: new Form(
            child: new Column(
              children: <Widget>[
                TextFormField(
                  controller: controller,
                  key: userNameKey,
                  decoration: new InputDecoration(
                      labelText: "请输入用户名", prefixIcon: Icon(Icons.person)),
                  onSaved: (value) {
                    userName = value;
                    print("onsave userName:$value");
                  },
                  onFieldSubmitted: (value) {
                    print("onFieldSubmitted userName $value");
                  },
                  onEditingComplete: () {
                    print("onEditingComplete userName");
                  },
                ),
                TextFormField(
                  key: userPasswordKey,
                  decoration: new InputDecoration(
                      labelText: "请输入密码", prefixIcon: Icon(Icons.lock)),
                  onSaved: (value) {
                    password = value;
                    print("onsave password:$value");
                  },
                  obscureText: true,
                  validator: (value) {
                    return value.length < 6 ? "密码不能少于6位" : null;
                  },
                ),
                new Container(
                    margin: EdgeInsets.only(top: 30),
                    child: SizedBox(
                      width: 340,
                      height: 45,
                      child: RaisedButton(
                        onPressed: () {
                          login(context);
                        },
                        color: Colors.green,
                        child: Text("登录",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
