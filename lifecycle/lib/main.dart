import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  AppLifecycleState _appLifecycleState;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _appLifecycleState = state;
      print("My App State: $_appLifecycleState");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return Center(
              child: Text(
                _appLifecycleState.toString(),
                style: TextStyle(
                  fontSize: 22.0,
                  color: orientation == Orientation.portrait
                      ? Colors.blue
                      : Colors.red,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
