import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin PlatformFunctions {
  bool isDesktop() {
    if (kIsWeb) return true;
    return !Platform.isAndroid && !Platform.isIOS;
  }

  bool isWebOrMobile() {
    if (kIsWeb) return true;
    return Platform.isAndroid || Platform.isIOS;
  }

  bool isMobile() {
    if (kIsWeb) return false;
    return Platform.isAndroid || Platform.isIOS;
  }

  int getAxisCountForGrid(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 300) return 1;
    if (width < 600) return 2;
    if (width < 900) return 3;
    if (width < 1200) return 4;
    return 5;
  }

  Future<void> activeNotifications(String? uid) async {
    if (!isMobile() || uid == null) return;

    final message = FirebaseMessaging.instance;
    //await message.deleteToken();
    final prefs = SharedPreferencesAsync();

    // 0.
    final enabled = await prefs.getBool('notificationsEnabled') ?? false;
    if (enabled) return;
    // 1. Pedir permiso
    final settings = await message.getNotificationSettings();
    // 2. Comprobar si se autorizó
    final authorizated = settings.authorizationStatus == AuthorizationStatus.authorized;
    // 3. Acciones si se autorizó 
    if (authorizated) {
      //await message.deleteToken();
      await message.subscribeToTopic(uid);
      await prefs.setBool('notificationsEnabled', true);
    }
  }

  Future<void> desactivateNotifications(String? uid) async {
    if (!isMobile() || uid == null) return;

    final message = FirebaseMessaging.instance;
    final prefs = SharedPreferencesAsync();

    await prefs.remove('notificationsEnabled');
    await message.deleteToken();
    await message.unsubscribeFromTopic(uid);
  }
}