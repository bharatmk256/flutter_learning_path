import 'package:flutter_sqflite/utils/network_util.dart';
import 'dart:async';
import '../models/user.dart';

class RestData {
  NetworkUtil _netUtil = NetworkUtil();
  static final BASE_URL = '';
  static final LOGIN_URL = '$BASE_URL/';

  Future<User> login(String username, String password) {
    return Future.value(User(username, password));
  }
}
