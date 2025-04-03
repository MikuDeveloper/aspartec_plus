import 'dart:typed_data' show Uint8List;

import 'package:firebase_auth/firebase_auth.dart' show User, UserCredential;

import '../models/aspartec_user.dart';

abstract class AspartecUserRepository {
  User? get currentUser;
  Future<UserCredential> registerAccount({ required String email, required String password });
  Future<UserCredential> login({required String email, required String password});
  Future<void> logout();
  Future<void> deleteAccount({required String password});

  Future<void> changePassword({required String oldPassword, required String newPassword});
  Future<void> resetPassword({required String email});

  Future<void> registerData({required AspartecUser aspartecUser});
  Future<AspartecUser> getData({String? id});

  Future<String> updateProfilePicture({required Uint8List picture});
  Future<void> updatePersonalData({required Map<String, dynamic> personalData});
  Future<void> updateSchoolData({required Map<String, dynamic> schoolData});
}