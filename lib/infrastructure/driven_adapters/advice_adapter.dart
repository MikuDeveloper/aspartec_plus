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
  Future<void> cancelAdvice({required String id}) async {
    try {
      final batch = _firestore.batch();
      final docRef = _firestore.collection(adviceCollection).doc(id);
      batch.update(docRef, { 'status': 'Cancelada' });
      await batch.commit();
    } on FirebaseException catch (e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<void> closeAdvice({required String id, required bool rating, required Uint8List evidence}) async {
    try {
      final path = evidencesPath + id;
      final url = await uploadPicture(path, evidence);
      final batch = _firestore.batch();
      final docRef = _firestore.collection(adviceCollection).doc(id);
      batch.update(docRef, { 'status': 'Completada', 'studentRating': rating, 'evidence': url });
      await batch.commit();
    } on FirebaseException catch (e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<List<Advice>> getAdvice({required Role role, required AdviceStatus status}) async {
    try {
      final field = role == Role.advisor ? 'advisorId' : 'studentId';
      final uid = _auth.currentUser?.uid ?? 'no-data';
      final userRef = _firestore.collection('users').doc(uid);

      final documents = await _firestore
        .collection(adviceCollection)
        .where(field, isEqualTo: userRef)
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
  
}