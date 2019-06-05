import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return HomePage();
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
            Navigator.of(context).pop("chat page back");
          },
        ),
        title: new Text('Chat'),
        centerTitle: true,
      ),
      body: new RootPager(),
    );
  }
}

class RootPager extends StatefulWidget {

  @override
  State createState() {
      return new ChatPageState();
  }
}

class ChatPageState extends State with WidgetsBindingObserver {

  String inputString = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    msgs.add("1");
    msgs.add("2");
    msgs.add("3");
    msgs.add("4");
    msgs.add("5");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(child: new Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textDirection: TextDirection.rtl,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[new Expanded(child:new ChatListView(),flex: 1,),new Expanded(child: new Container(
      alignment: Alignment.bottomCenter,
      child: new Row(children: <Widget>[
        new Expanded(
          child: new Container(color: Colors.blue,
            child: new TextField(
              decoration: new InputDecoration(hintText: 'input msg',
                  disabledBorder: InputBorder.none,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0))
              , textAlign: TextAlign.center,onChanged: (value) {
              inputString = value;
            },)
            ,
          ),
          flex: 1,
        )
        , new Expanded(
          child: new Container(
              child: new MaterialButton(child: new Text("发送"),
                color: Colors.red,
                onPressed: () {
                  if(inputString.isEmpty) return;
                  setState(() {
                    msgs.add(inputString);
                  });
                },
                minWidth: 50,
                height: 50,)
          )
          , flex: 0,
        )
      ]
      ),
    ),flex: 0,)],),)
    );
  }
}

List<String> msgs = new List();

class ChatListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (context, position) {
        if (position.isOdd) return new Divider();
        return new ListTile( title: new Text(msgs[position],textAlign: TextAlign.center,));
      },
      itemCount: msgs.length,
    );
  }
}

class InputView extends StatefulWidget {
  @override
  State createState() {
    return new BottomState();
  }
}

  class BottomState extends State {

    void _refreshUI(String msg) {
      msgs.add(msg);
    }

    @override
    Widget build(BuildContext context) {

    }
}