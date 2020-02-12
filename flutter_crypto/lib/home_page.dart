import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List currencies;

  HomePage(this.currencies);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List currencies;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto App'),
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                final Map currency = widget.currencies[index];
                final MaterialColor color = _colors[index % _colors.length];
                return _getListItemUi(currency, color);
              },
              itemCount: widget.currencies.length,
            ),
          ),
        ],
      ),
    );
  }

  ListTile _getListItemUi(Map currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(currency['name'][0]),
        backgroundColor: color,
      ),
      title: Text(
        currency['name'],
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: _getSubTitleText(
        currency['price_usd'],
        currency['percent_change_1h'],
      ),
      isThreeLine: true,
    );
  }

  Widget _getSubTitleText(String priceUSD, String precentageChange) {
    TextSpan priceTextWidget = TextSpan(
      text: '\$$priceUSD\n',
      style: TextStyle(color: Colors.black),
    );
    String percentageChangeText = '1 hour: $precentageChange%';
    TextSpan percentageChangeTextWidget;

    if (double.parse(precentageChange) > 0) {
      percentageChangeTextWidget = TextSpan(
        text: percentageChangeText,
        style: TextStyle(color: Colors.green),
      );
    } else {
      percentageChangeTextWidget = TextSpan(
        text: percentageChangeText,
        style: TextStyle(color: Colors.red),
      );
    }

    return RichText(
      text: TextSpan(
        children: [
          priceTextWidget,
          percentageChangeTextWidget,
        ],
      ),
    );
  }
}
