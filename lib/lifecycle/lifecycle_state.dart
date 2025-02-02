import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class LifecycleState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResumed();
        break;
      case AppLifecycleState.inactive:
        onInactive();
        break;
      case AppLifecycleState.paused:
        onPaused();
        break;
      case AppLifecycleState.detached:
        onDetached();
        break;
    }
  }

  void onResumed() {
    if (kDebugMode) {
      print("on resumed");
    }
  }

  void onPaused() {
    if (kDebugMode) {
      print("on paused");
    }
  }

  void onInactive() {
    if (kDebugMode) {
      print("on inactive");
    }
  }

  void onDetached() {
    if (kDebugMode) {
      print("on detached");
    }
  }
}
