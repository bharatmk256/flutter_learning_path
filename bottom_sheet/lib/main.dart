import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  VoidCallback _showPersBottomSheetCallBack;

  @override
  void initState() {
    super.initState();
    _showPersBottomSheetCallBack = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet(
          (context) {
            return Container(
              height: 450.0,
              color: Colors.greenAccent,
              child: Center(
                child: Text('Hi BottomSheet'),
              ),
            );
          },
        )
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showPersBottomSheetCallBack = _showBottomSheet;
            });
          }
        });
  }

  void _showModelSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          color: Colors.greenAccent,
          child: Center(
            child: Text('Hi ModalSheet'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Flutter BottomSheet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: _showPersBottomSheetCallBack,
                child: Text('Persistant'),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                onPressed: _showModelSheet,
                child: Text('Modal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
