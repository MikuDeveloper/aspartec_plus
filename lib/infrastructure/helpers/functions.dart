import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

import 'exceptions/auth_exception.dart';
import 'exceptions/database_exception.dart';
import 'exceptions/storage_exception.dart';

Exception getException(String plugin, String code) => switch(plugin) {
  'firebase_auth' => AuthException(code: code),
  'cloud_firestore' => DatabaseException(code: code),
  'firebase_storage' => StorageException(code: code),
  _ => Exception(code)
};

Future<String> uploadPicture(String path, Uint8List bytes) async {
  final storageRef = FirebaseStorage.instance.ref(path);
  await storageRef.putData(bytes, SettableMetadata(contentType: 'image/jpg'));
  return await storageRef.getDownloadURL();
}

Future<String> getPictureURL(String path) async {
  final storageRef = FirebaseStorage.instance.ref(path);
  return await storageRef.getDownloadURL();
}