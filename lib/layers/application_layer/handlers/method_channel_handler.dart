import 'package:flutter/services.dart';

import '../constants/app_constants.dart';

class MethodChannelHandler {
  static const MethodChannel _channel =
      MethodChannel(AppConstants.methodChannel);

  static Future<void> invokeMethod(String method, [dynamic arguments]) async {
    await _channel.invokeMethod(method, arguments);
  }

  static void setMethodCallHandler(
    Future<dynamic> Function(MethodCall call)? handler,
  ) {
    _channel.setMethodCallHandler(handler);
  }
}
