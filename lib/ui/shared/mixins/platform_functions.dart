import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

mixin PlatformFunctions {
  bool isDesktop() {
    if (kIsWeb) {
      return true;
    } else if (!Platform.isAndroid && !Platform.isIOS) {
      return true;
    }
    return false;
  }

  bool isWebOrMobile() {
    if (kIsWeb) {
      return true;
    } else if (Platform.isAndroid || Platform.isIOS) {
      return true;
    }
    return false;
  }

  int getAxisCountForGrid(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 300) return 1;
    if (width < 600) return 2;
    if (width < 900) return 3;
    if (width < 1200) return 4;
    return 5;
  }
}