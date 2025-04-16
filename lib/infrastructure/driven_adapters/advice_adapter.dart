import 'dart:typed_data';

import 'package:aspartec_plus/app/global/enums.dart' show Role, AdviceStatus;
import 'package:aspartec_plus/infrastructure/helpers/functions.dart' show getException, uploadPicture;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/models/advice.dart';
import '../../domain/repositories/advice_repository.dart';
import '../helpers/constants.dart' show adviceCollection, evidencesPath;

class AdviceAdapter implements AdviceRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createAdvice({required String subject, required String topic, required String advisorId}) async {
    try {
      final studentId = _auth.currentUser?.uid;
      if (studentId == null) throw FirebaseException(plugin: 'firebase_auth', code: 'expired-session');

      final adviceDupli = await _firestore
      .collection(adviceCollection)
      .where('advisorId', isEqualTo: advisorId)
      .where('subject', isEqualTo: subject)
      .where('status', isEqualTo: AdviceStatus.opened.displayName)
      .get();
      if (adviceDupli.docs.isNotEmpty) throw FirebaseException(plugin: 'cloud_firestore', code: 'advice-already-exists');
      
      final adviceRef = _firestore.collection(adviceCollection).doc();
      final advice = Advice(
        id: adviceRef.id,
        subject: subject,
        topic: topic,
        status: AdviceStatus.opened,
        advisorId: advisorId,
        studentId: studentId,
        startDate: FieldValue.serverTimestamp(),
        endDate: null, 
        advisorRating: 0.0,
        studentRating: 0.0,
        evidencePath: ''
      );
      final batch = _firestore.batch();
      batch.set(adviceRef, advice.toJson());
      await batch.commit();
    } on FirebaseException catch (e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<void> cancelAdvice({required String id}) async {
    try {
      final batch = _firestore.batch();
      final docRef = _firestore.collection(adviceCollection).doc(id);
      batch.update(docRef, { 'status': AdviceStatus.canceled.displayName });
      await batch.commit();
    } on FirebaseException catch (e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<void> closeAdvice({required String id, required double rating, required Uint8List evidence}) async {
    try {
      final path = evidencesPath + id;
      await uploadPicture(path, evidence);
      final batch = _firestore.batch();
      final docRef = _firestore.collection(adviceCollection).doc(id);
      batch.update(docRef, { 
        'status': AdviceStatus.forRating.displayName,
        'studentRating': rating,
        'evidencePath': path,
        'endDate': FieldValue.serverTimestamp()
      });
      await batch.commit();
    } on FirebaseException catch (e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<List<Advice>> getAdvice({required Role role, required AdviceStatus status}) async {
    try {
      final field = role == Role.advisor ? 'advisorId' : 'studentId';
      final uid = _auth.currentUser?.uid;
      if (uid == null) throw FirebaseException(plugin: 'firebase_auth', code: 'expired-session');

      final documents = await _firestore
        .collection(adviceCollection)
        .where(field, isEqualTo: uid)
        .where('status', isEqualTo: status.displayName)
        .get();

      return documents.docs.map((doc) => Advice.fromJson(doc.data())).toList();
    } on FirebaseException catch (e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<void> skipAdvice({required String id}) async {
    
  }

  @override
  Future<void> ratingAdvisor({required String id, required double rating}) async {
    try {
      final adviceRef = _firestore.collection(adviceCollection).doc(id);
      final batch = _firestore.batch();
      batch.update(adviceRef, { 'advisorRating': rating, 'status': AdviceStatus.completed.displayName });
      await batch.commit();
    } on FirebaseException catch (e) {
      throw getException(e.plugin, e.code);
    }
  }
  
}