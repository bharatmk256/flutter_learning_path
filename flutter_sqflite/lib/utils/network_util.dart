import 'dart:async';

class NetworkUtil {
  static NetworkUtil _instance = NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  Future<dynamic> get() {
    return null;
  }
}
