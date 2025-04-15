import 'dart:io';

import 'package:flutter/foundation.dart';

mixin PlatformFunctions {
  bool isDesktop() {
    if (kIsWeb) {
      return true;
    } else if (!Platform.isAndroid && !Platform.isIOS) {
      return true;
    }

    return false;
  }
}