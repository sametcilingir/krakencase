import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ExceptionHandler {
  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  void init() {
    FlutterError.onError = (FlutterErrorDetails errorDetails) {
      recordFatalError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      recordError(
        error,
        stack,
      );
      return false;
    };
  }

  void recordError(
    Object? exception,
    StackTrace? stack, {
    String? reason,
    bool? fatal,
  }) {
    unawaited(
      _crashlytics.recordError(
        exception ?? 'Unknown exception',
        stack,
        fatal: fatal ?? false,
      ),
    );
  }

  void recordFatalError(
    FlutterErrorDetails errorDetails,
  ) {
    unawaited(_crashlytics.recordFlutterFatalError(errorDetails));
  }
}
