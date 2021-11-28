library prelude;

export 'package:prelude/ui.dart';
export 'package:prelude/persist.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

class Prelude {
  static Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      await FlutterDisplayMode.setHighRefreshRate();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
