import 'package:aspartec_plus/infrastructure/helpers/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/models/subject.dart';
import '../../domain/repositories/subject_repository.dart';
import '../helpers/functions.dart' show getException;

class SubjectAdapter implements SubjectRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Subject>> getSubjects() async {
    try {
      final snapshot = await _firestore.collection(subjectsCollection).get();
      return snapshot.docs.map((doc) => Subject.fromJson(doc.data())).toList();
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<void> joinSubject({required String subject}) async {
    try {
      final uid = _auth.currentUser?.uid ?? 'no-data';
      final userRef = _firestore.collection(usersCollection).doc(uid);
      final batch = _firestore.batch();
      batch.update(userRef, { 'adviceTaught': FieldValue.arrayUnion([subject]) });
      await batch.commit();
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<void> leaveSubject({required String subject}) async {
    try {
      final uid = _auth.currentUser?.uid ?? 'no-data';
      final userRef = _firestore.collection(usersCollection).doc(uid);
      final batch = _firestore.batch();
      batch.update(userRef, { 'adviceTaught': FieldValue.arrayRemove([subject]) });
      await batch.commit();
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

}