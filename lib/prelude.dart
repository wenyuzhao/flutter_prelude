library prelude;

export 'package:prelude/ui.dart';
export 'package:prelude/persist.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

class _Platform {
  void setEdgeToEdge(
      {Brightness brightness = Brightness.dark,
      Color? statusBarColor,
      Color? navigationBarColor,
      transparentNavigationBar = false,
      double navigationBarOpacity = 0.1}) {
    final defaultStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;
    navigationBarColor ??= defaultStyle.systemNavigationBarColor ??
        (brightness == Brightness.dark ? Colors.black : Colors.white);
    navigationBarOpacity =
        transparentNavigationBar ? 0.0 : navigationBarOpacity;
    navigationBarColor = navigationBarColor.withOpacity(navigationBarOpacity);
    SystemChrome.setSystemUIOverlayStyle(defaultStyle.copyWith(
      systemStatusBarContrastEnforced: true,
      statusBarColor: statusBarColor,
      systemNavigationBarColor: navigationBarColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
}

class Prelude {
  static final _Platform platform = _Platform();

  static Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      await FlutterDisplayMode.setHighRefreshRate();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
