import 'package:flutter/material.dart';

const _name = 'Bharat';

class ChatMessage extends StatelessWidget {
  final String text;

  ChatMessage({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              right: 16.0,
            ),
            child: CircleAvatar(
              child: Text(_name[0]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _name,
                style: Theme.of(context).textTheme.subhead,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ],
          )
        ],
      ),
    );
  }
}
