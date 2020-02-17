import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drawer/new_page.dart';

void main() {
  return runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[50]
              : null),
      home: HomePage(),
//        routes: <String, WidgetBuilder>{
//          '/a': (BuildContext context) => NewPage('New Page'),
//        }
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer App'),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Bharat Makwana'),
              accountEmail: Text('bharatmk257@.gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.black
                        : Colors.white,
                child: Text(
                  'B',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.black
                          : Colors.white,
                  child: Text(
                    'C',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              title: Text('Page One'),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => NewPage('Page One'),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Page Two'),
              trailing: Icon(Icons.arrow_downward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => NewPage('Page Two'),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
