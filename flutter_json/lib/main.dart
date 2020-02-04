import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Json'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/person.json'),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              // Decode Json
              var myData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text('Name: ' + myData[index]['name']),
                        Text('Age: ' + myData[index]['age']),
                        Text('Height: ' + myData[index]['height']),
                        Text('Gender: ' + myData[index]['gender']),
                        Text('Hair Color: ' + myData[index]['hair_color']),
                      ],
                    ),
                  );
                },
                itemCount: myData == null ? 0 : myData.lenght,
              );
            },
          ),
        ),
      ),
    );
  }
}
