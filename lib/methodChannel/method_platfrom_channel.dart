import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';

const methodChannel = const MethodChannel('com.weather.flutter.platformChannel');

class WeatherMethodChannel {
  static MethodHandler handler = MethodHandler();

  static initMethodChannel () {
    methodChannel.setMethodCallHandler((call) async {
      handler.handle(call.method, call.arguments);
    });
  }
}

class MethodHandler {
  void handle (String method, dynamic arguments) {
    Logger.log('MethodHandler#MethodHandler~~~, $method');
  }
}