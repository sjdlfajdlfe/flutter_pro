import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pro/chat/chat.dart';
import 'package:flutter_pro/account/account_Info.dart';
import 'package:flutter_pro/fastfood/fastfood.dart';
import 'package:flutter_pro/test/page_anim.dart';
import 'package:flutter_pro/test/container.dart';
import 'package:flutter_pro/favorite/favorite.dart';
import 'dart:async';

class MyHomePage extends StatelessWidget {
  var color = TextStyle(color: Colors.white);
  var code = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559738056100&di=3e8599cc90b96303cfab19bad244c693&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F07c6686e680086ee3c92eb48e10df3325832fac568d-uvzROb_fw658';
  var avatar = 'http://sandbox-ugc.boochat.cn/avatar/2019/01/19/14/178d257b-386c-4a5a-b312-bcca13e086e1.png';
  var bgImage = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559568860847&di=ccc79e16aa27e4f3f9cf659a6eefa99d&imgtype=0&src=http%3A%2F%2Ftc.sinaimg.cn%2Fmaxwidth.2048%2Ftc.service.weibo.com%2Fp%2Fimage_youjuke_com%2Fd6cda9b760bee1824645a825a1285edc.jpg';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter'),
          actions: <Widget>[
            SearchWidget()
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            new RandomWords(),
            new RandomWords(),
            new RandomWords(),
            new RandomWords(),
            new RandomWords()
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {

        }, child: Text('Action')),
        drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                UserAccountsDrawerHeader(accountEmail: Text('850170603@qq.com', style: color),accountName: Text('liuwenji', style: color),
                  currentAccountPicture:
                  CircleAvatar(backgroundImage: NetworkImage(avatar)),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(bgImage)
                      )
                  ),
                  onDetailsPressed: () {
                      print("onDetailsPressed");
                  },
                  otherAccountsPictures: <Widget>[new InkWell(child: Image.asset("images/add_icon_code.png"),onTap: () {
                      print("jump scan code");
                  },)],
                ),
                ListTile(title: Text('我喜欢的'), trailing: Icon(Icons.favorite),onTap: () {
                  //Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("点击喜欢菜单")));
                    toFavorite(context);
                },),
                ListTile(title: Text('我收藏的'), trailing: Icon(Icons.fastfood),onTap: () {
                  //Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("点击收藏菜单")));
                  toFastFood(context);
                },),
                Divider(),
                ListTile(title: Text('个人信息'), trailing: Icon(Icons.face), onTap: () {
                  toAccountInfo(context);
                },),
              ],
            )
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.lightBlue),
          height: 60,
          child: TabBar(
            labelStyle: TextStyle(height: 0.5, fontSize: 12),
            tabs: <Widget>[
              Tab(icon: Icon(Icons.memory), text: 'A'),
              Tab(icon: Icon(Icons.money_off), text: 'B'),
              Tab(icon: Icon(Icons.add_circle, size: 52, color: Colors.white)),
              Tab(icon: Icon(Icons.high_quality), text: 'C'),
              Tab(icon: Icon(Icons.my_location), text: 'D')
            ],
          ),
        ),
      ),
    );
  }
}

void toAccountInfo(BuildContext context) {
//  const platform = const MethodChannel("com.nixi.boo.main.channel");
//  try {
//    final int result = await platform.invokeMethod('jump_account_info_page');
//  } on PlatformException catch(e) {
//  }
//    Navigator.push(context,new MaterialPageRoute(builder: (context) =>
//      new AccountInfoPage())).then((data) {
//        print("account info back result: $data");
//  });
  Navigator.push(context,new MaterialPageRoute(builder: (context) =>
  new ContainerTest())).then((data) {
    print("account info back result: $data");
  });
}

void toFastFood(BuildContext context) {
  Navigator.of(context).push(new MaterialPageRoute(builder: (context) =>
  new FastFood())).then((value) {
    print("fastfood back data: $value");
  });
//  Navigator.of(context).push(new MaterialPageRoute(builder: (context) =>
//      new FirstPage())).then((value) {
//        print("fastfood back data: $value");
//      });
}

void toFavorite(BuildContext context) {
  Navigator.of(context).push(new MaterialPageRoute(builder: (context) =>
  new FavoritePage())).then((value) {
    print("favorite back data: $value");
  });
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该行书湖添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
//      onTap: () {
//        setState(() {
//          if (alreadySaved) {
//             _saved.remove(pair);
//          } else {
//             _saved.add(pair);
//          }
//        });
//      },
      onLongPress: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
      onTap: () {
        toChat();
      },
    );
  }

  void toChat()  {
//    const platform = const MethodChannel("com.nixi.boo.main.channel");
//    try {
//      final int result = await platform.invokeMethod('jump_chat_page');
//    } on PlatformException catch(e) {
//
//    }
    Navigator.push(context,new MaterialPageRoute(builder: (context) =>
    new ChatPage())).then((data) {
      print("account info back result: $data");
    });
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class SearchWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.search),onPressed: () {
      Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("搜索功能后面添加")));
    });
  }
}