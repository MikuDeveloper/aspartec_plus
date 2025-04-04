import 'dart:typed_data' show Uint8List;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/models/aspartec_user.dart';
import '../../domain/repositories/aspartec_user_repository.dart';
import '../helpers/constants.dart';
import '../helpers/functions.dart' show getException, uploadPicture;

class AspartecUserAdapter implements AspartecUserRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<void> changePassword({required String oldPassword, required String newPassword}) async {
    try {
      final email = _auth.currentUser?.email ?? 'no-data@gmail.com';
      await _auth.signInWithEmailAndPassword(email: email, password: oldPassword);
      await _auth.currentUser!.updatePassword(newPassword);
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<void> deleteAccount({required String password}) async {
    try {
      final email = _auth.currentUser?.email ?? 'no-data@gmail.com';
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await _auth.currentUser!.delete();
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<AspartecUser> getData({String? id}) async {
    try {
      final uid = id ?? _auth.currentUser?.uid ?? 'no-data';
      final userSnapshot = await _firestore.collection(usersCollection).doc(uid).get();
      return userSnapshot.exists 
        ? AspartecUser.fromJson(userSnapshot.data()!) 
        : AspartecUser.fromJson({});
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<UserCredential> login({required String email, required String password}) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<UserCredential> registerAccount({required String email, required String password}) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<void> registerData({required AspartecUser aspartecUser}) async {
    try {
      final uid = _auth.currentUser!.uid;
      final userRef = _firestore.collection(usersCollection).doc(uid);
      final batch = _firestore.batch();
      batch.set(userRef, aspartecUser.copyWith(uid: uid).toJson());
      await batch.commit();
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<void> updatePersonalData({required Map<String, dynamic> personalData}) async {
    try {
      final uid = _auth.currentUser!.uid;
      final userRef = _firestore.collection(usersCollection).doc(uid);
      final batch = _firestore.batch();
      batch.update(userRef, personalData);
      await batch.commit();
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<String> updateProfilePicture({required Uint8List picture}) async {
    try {
      final uid = _auth.currentUser!.uid;
      final path = avatarsPath + uid;
      return await uploadPicture(path, picture);
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<void> updateSchoolData({required Map<String, dynamic> schoolData}) async {
    try {
      final uid = _auth.currentUser!.uid;
      final userRef = _firestore.collection(usersCollection).doc(uid);
      final batch = _firestore.batch();
      batch.update(userRef, schoolData);
      await batch.commit();
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }
}