import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class MethodChannelMock {
  static const MethodChannel _channel = MethodChannel('com.sametcilingir.krakencase/channel');

  static void setUp() {
    _channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'fetchAnimeList') {
        return null;
      }
      throw MissingPluginException('No mock implementation found for method ${methodCall.method}');
    });
  }

  static void tearDown() {
    _channel.setMockMethodCallHandler(null); 
  }
}