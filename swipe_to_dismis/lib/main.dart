import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe to dismiss',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final List<String> items = List<String>.generate(30, (i) => 'Items ${i + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe to dismiss'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]),
            child: ListTile(
              title: Text('${items[index]}'),
            ),
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (direction) {
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Item dismissed'),
                ),
              );
            },
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
