import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

void main() async {
  List currencies = await getCurrencies();
  print(currencies);
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;

  MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[100]
              : null),
      home: HomePage(_currencies),
    );
  }
}

Future<List> getCurrencies() async {
  String cryptoUrl = 'https://api.coinmarketcap.com/v1/ticker/?limit=50';
  http.Response response = await http.get(cryptoUrl);
  return json.decode(response.body);
}
