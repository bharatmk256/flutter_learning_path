import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'chat_message.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: ChatScreen(),
    );
  }
}
