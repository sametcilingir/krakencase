import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../constants/app_constants.dart';

@lazySingleton
class MethodChannelHandler {
  final MethodChannel _channel = const MethodChannel(AppConstants.methodChannel);

  Future<void> invokeMethod(String method, [dynamic arguments]) async {
    await _channel.invokeMethod(method, arguments);
  }

  void setMethodCallHandler(
    Future<dynamic> Function(MethodCall call)? handler,
  ) {
    _channel.setMethodCallHandler(handler);
  }
}
