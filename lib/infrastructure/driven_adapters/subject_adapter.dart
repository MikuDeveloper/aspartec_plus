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

  converter() => ();

  @override
  Future<List<Subject>> getAdvisorSubjects({required List<String> adviceTaught}) async {
    try {
      final subjectsDocs = await Future.wait(
        adviceTaught.map(
          (id) => _firestore.collection(subjectsCollection).doc(id).withConverter<Subject>(
            fromFirestore: (snapshot, _) => Subject.fromJson(snapshot.data() ?? {}),
            toFirestore: (model, _) => model.toJson()
            ).get()
        ),
        eagerError: true
      );

      return subjectsDocs.map((doc) => doc.data() ?? Subject.fromJson({})).toList();
    } on FirebaseException catch (e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<void> joinSubject({required String id}) async {
    try {
      final uid = _auth.currentUser?.uid ?? 'no-data';
      final userRef = _firestore.collection(usersCollection).doc(uid);
      final batch = _firestore.batch();
      batch.update(userRef, { 'adviceTaught': FieldValue.arrayUnion([id]) });
      await batch.commit();
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

  @override
  Future<void> leaveSubject({required String id}) async {
    try {
      final uid = _auth.currentUser?.uid ?? 'no-data';
      final userRef = _firestore.collection(usersCollection).doc(uid);
  
      final batch = _firestore.batch();
      batch.update(userRef, { 'adviceTaught': FieldValue.arrayRemove([id]) });
      await batch.commit();
    } on FirebaseException catch(e) {
      throw getException(e.plugin, e.code);
    }
  }

}