import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Card列表'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'AAAAAAAA',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: Text('AAAA subtitle'),
              leading: Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
            ),
            ListTile(
              title: Text(
                'BBBBBBBB',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: Text('BBBB subtitle'),
              leading: Icon(
                Icons.school,
                color: Colors.lightBlue,
              ),
            ),
            ListTile(
              title: Text(
                'CCCCCCC',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: Text('CCCC subtitle'),
              leading: Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
            ),
            ListTile(
              title: Text(
                'DDDDDDDDD',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: Text('DDDD subtitle'),
              leading: Icon(
                Icons.school,
                color: Colors.lightBlue,
              ),
            ),
            ListTile(
              title: Text(
                'EEEEEEEE',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: Text('EEEE subtitle'),
              leading: Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
